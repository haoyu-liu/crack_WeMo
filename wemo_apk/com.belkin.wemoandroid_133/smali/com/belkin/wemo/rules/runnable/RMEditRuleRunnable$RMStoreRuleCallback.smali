.class Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;
.super Ljava/lang/Object;
.source "RMEditRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMStoreRuleCallback"
.end annotation


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

    .line 156
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    .line 157
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 158
    return-void
.end method


# virtual methods
.method public onRulesStored()V
    .locals 3

    .prologue
    .line 172
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMUserRules;->setTempDBRuleToEditOrDelete(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 175
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

    if-eqz v0, :cond_0

    .line 176
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;->onSuccess(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 178
    :cond_0
    return-void
.end method

.method public onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 2
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 167
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMUserRules;->replaceRule(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;

    .line 168
    return-void
.end method
