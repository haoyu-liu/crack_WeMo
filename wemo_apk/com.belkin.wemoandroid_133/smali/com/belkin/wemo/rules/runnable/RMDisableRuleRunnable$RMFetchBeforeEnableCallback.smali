.class public Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;
.super Ljava/lang/Object;
.source "RMDisableRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "RMFetchBeforeEnableCallback"
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

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;Ljava/util/List;)V
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
    .line 52
    .local p2, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->activeDeviceList:Ljava/util/List;

    .line 54
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 81
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
    .line 59
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    sget-object v2, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRule(I)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$002(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;

    .line 60
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 63
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->getRequestedState()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/data/RMRule;->setState(I)V

    .line 65
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMToggleRuleComposerCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v4}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->activeDeviceList:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMToggleRuleComposerCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;Ljava/util/List;)V

    .line 67
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMToggleRuleComposerCallback;
    sget-object v1, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->INSTANCE:Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->getInstance(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;

    move-result-object v6

    .line 68
    .local v6, "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    invoke-virtual {v6, v0, v0}, Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;->disable(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V

    .line 74
    .end local v0    # "callback":Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMToggleRuleComposerCallback;
    .end local v6    # "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    :cond_0
    :goto_0
    return-void

    .line 70
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 71
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v3, 0x1f6

    const-string v4, "No rule was found for rule ID provided"

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_0
.end method
