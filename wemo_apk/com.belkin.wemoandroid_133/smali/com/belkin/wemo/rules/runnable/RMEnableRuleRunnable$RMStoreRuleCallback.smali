.class Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;
.super Ljava/lang/Object;
.source "RMEnableRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMStoreRuleCallback"
.end annotation


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    .line 175
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .line 176
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 177
    return-void
.end method


# virtual methods
.method public onRulesStored()V
    .locals 2

    .prologue
    .line 191
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;->onRuleToggled(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 194
    :cond_0
    return-void
.end method

.method public onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 2
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 181
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->restorePreviousState(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 183
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 186
    :cond_0
    return-void
.end method
