.class Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;
.super Ljava/lang/Object;
.source "RMEditRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;
.implements Lcom/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RMEditRuleConflictCallback"
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

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p5, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

    .line 86
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    .line 87
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 88
    iput-object p5, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->activeDeviceList:Ljava/util/List;

    .line 89
    return-void
.end method


# virtual methods
.method public onConflictFound(Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;

    .prologue
    .line 106
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 109
    :cond_0
    return-void
.end method

.method public onNoConflictFound()V
    .locals 7

    .prologue
    .line 94
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    sget-object v2, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/rules/data/RMUserRules;->replaceRule(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$302(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;

    .line 95
    sget-object v1, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    invoke-static {v2}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;->access$300(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/data/RMUserRules;->setTempDBRuleToEditOrDelete(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 98
    sget-object v1, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->INSTANCE:Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->getInstance(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;

    move-result-object v6

    .line 100
    .local v6, "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleConflictCallback;->activeDeviceList:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMEditRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMEditRuleErrorCallback;Ljava/util/List;)V

    .line 101
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMEditRuleRunnable$RMEditRuleComposerCallback;
    invoke-virtual {v6, v0, v0}, Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;->edit(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V

    .line 102
    return-void
.end method
