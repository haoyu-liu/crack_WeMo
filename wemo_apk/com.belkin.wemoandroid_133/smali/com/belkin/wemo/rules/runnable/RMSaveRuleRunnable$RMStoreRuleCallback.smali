.class Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;
.super Ljava/lang/Object;
.source "RMSaveRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMStoreRuleCallback"
.end annotation


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    .line 162
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    .line 163
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 164
    return-void
.end method


# virtual methods
.method public onRulesStored()V
    .locals 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    invoke-static {v0}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->access$700(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "STORE RULES (or equivalent API) SUCCEEDED. RULE SAVE COMPLETE"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;->onSuccess(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 183
    :cond_0
    return-void
.end method

.method public onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 2
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 169
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMUserRules;->deleteRule(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;

    .line 171
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 174
    :cond_0
    return-void
.end method
