.class public Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;
.super Ljava/lang/Object;
.source "RMEnableRuleRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/data/callback/RMRuleConflictErrorCallback;
.implements Lcom/belkin/wemo/rules/data/callback/RMRuleConflictSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "RMEnableRuleConflictCallback"
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

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p5, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    .line 105
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .line 106
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 107
    iput-object p5, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->activeDeviceList:Ljava/util/List;

    .line 108
    return-void
.end method


# virtual methods
.method public onConflictFound(Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;->getErrorCode()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/data/error/RMRuleConflictError;->getErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 128
    :cond_0
    return-void
.end method

.method public onNoConflictFound()V
    .locals 7

    .prologue
    .line 113
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    invoke-virtual {v2}, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->getRequestedState()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/data/RMRule;->setState(I)V

    .line 117
    sget-object v1, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->INSTANCE:Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/rules/composer/impl/RMRuleComposerFactory;->getInstance(Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;

    move-result-object v6

    .line 119
    .local v6, "composer":Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;, "Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer<+Lcom/belkin/wemo/rules/data/RMRule;>;"
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;->activeDeviceList:Ljava/util/List;

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;Ljava/util/List;)V

    .line 120
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;
    invoke-virtual {v6, v0, v0}, Lcom/belkin/wemo/rules/composer/RMAbstractRuleComposer;->enable(Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesSuccessCallback;Lcom/belkin/wemo/rules/composer/callback/RMComposeRulesErrorCallback;)V

    .line 121
    return-void
.end method
