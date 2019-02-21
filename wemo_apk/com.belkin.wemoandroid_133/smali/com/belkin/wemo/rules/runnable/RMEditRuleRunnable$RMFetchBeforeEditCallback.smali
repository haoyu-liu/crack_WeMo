.class Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;
.super Ljava/lang/Object;
.source "RMEditRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMFetchBeforeEditCallback"
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

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;Ljava/util/List;)V
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
    .line 55
    .local p2, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->activeDeviceList:Ljava/util/List;

    .line 57
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 71
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/util/List;)V
    .locals 6
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
    .line 62
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v3}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v4}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$200(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->activeDeviceList:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;Ljava/util/List;)V

    .line 63
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMFetchBeforeEditCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$000(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v0}, Lcom/belkin/wemo/rules/data/RMUserRules;->verifyRuleConflicts(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback;Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;)V

    .line 64
    return-void
.end method
