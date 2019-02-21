.class Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;
.super Ljava/lang/Object;
.source "RMDisableRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMStoreRuleCallback"
.end annotation


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .prologue
    .line 135
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    .line 137
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .line 138
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 139
    return-void
.end method


# virtual methods
.method public onRulesStored()V
    .locals 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;->onRuleToggled(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 156
    :cond_0
    return-void
.end method

.method public onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 2
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 143
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->restorePreviousState(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 145
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 148
    :cond_0
    return-void
.end method
