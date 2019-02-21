.class public Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;
.super Ljava/lang/Object;
.source "RMEnableRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;
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

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;Ljava/util/List;)V
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
    .line 56
    .local p2, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->activeDeviceList:Ljava/util/List;

    .line 58
    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v0, v0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

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
    .line 63
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    sget-object v2, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget v3, v3, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->ruleId:I

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRule(I)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    iput-object v2, v1, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 64
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v1, v1, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    if-eqz v1, :cond_1

    .line 67
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v2, v2, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v3, v3, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v4, v4, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->activeDeviceList:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;Ljava/util/List;)V

    .line 68
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v2, v2, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v1, v2, v0, v0}, Lcom/belkin/wemo/rules/data/RMUserRules;->verifyRuleConflicts(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback;Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;)V

    .line 74
    .end local v0    # "callback":Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;
    :cond_0
    :goto_0
    return-void

    .line 70
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v1, v1, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    if-eqz v1, :cond_0

    .line 71
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v1, v1, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v3, 0x1f6

    const-string v4, "No rule was found for rule ID provided"

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_0
.end method
