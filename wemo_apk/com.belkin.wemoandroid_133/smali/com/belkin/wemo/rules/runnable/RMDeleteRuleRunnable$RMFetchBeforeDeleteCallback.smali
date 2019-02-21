.class Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;
.super Ljava/lang/Object;
.source "RMDeleteRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMFetchBeforeDeleteCallback"
.end annotation


# instance fields
.field private activeDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;


# direct methods
.method private constructor <init>(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Ljava/util/List;)V
    .locals 0
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
    .line 54
    .local p2, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->activeDeviceList:Ljava/util/List;

    .line 56
    return-void
.end method

.method synthetic constructor <init>(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Ljava/util/List;Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;
    .param p2, "x1"    # Ljava/util/List;
    .param p3, "x2"    # Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$1;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 84
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 7
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
    .line 63
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    sget-object v2, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMUserRules;->deleteRule(I)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$102(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;

    .line 64
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v1

    if-nez v1, :cond_1

    .line 65
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 66
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v3, 0x1f6

    const-string v4, "No rule was found for rule ID provided"

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 77
    :cond_0
    :goto_0
    return-void

    .line 70
    :cond_1
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/data/RMUserRules;->setTempDBRuleToEditOrDelete(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 73
    sget-object v1, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->INSTANCE:Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->getInstance(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;

    move-result-object v6

    .line 74
    .local v6, "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$400(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v4}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;->activeDeviceList:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;Ljava/util/List;)V

    .line 75
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;
    invoke-virtual {v6, v0, v0}, Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;->delete(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V

    goto :goto_0
.end method
