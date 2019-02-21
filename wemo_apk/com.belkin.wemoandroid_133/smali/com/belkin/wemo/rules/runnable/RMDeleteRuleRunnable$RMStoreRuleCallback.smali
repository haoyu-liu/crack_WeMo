.class Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;
.super Ljava/lang/Object;
.source "RMDeleteRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
.implements Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMStoreRuleCallback"
.end annotation


# instance fields
.field private deletedrule:Lcom/belkin/wemo/rules/data/RMRule;

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

    .line 132
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    .line 133
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->deletedrule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 134
    return-void
.end method


# virtual methods
.method public onRulesStored()V
    .locals 2

    .prologue
    .line 147
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMUserRules;->setTempDBRuleToEditOrDelete(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 150
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    invoke-static {v1}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$100(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;->onSuccess(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 153
    :cond_0
    return-void
.end method

.method public onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 2
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->deletedrule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-static {v0, v1}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->access$500(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 140
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    invoke-interface {v0, p1}, Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 143
    :cond_0
    return-void
.end method
