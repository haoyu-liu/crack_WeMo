.class public Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMEnableRuleRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMStoreRuleCallback;,
        Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMToggleRuleComposerCallback;,
        Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMEnableRuleConflictCallback;,
        Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;
    }
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

.field protected errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

.field protected rule:Lcom/belkin/wemo/rules/data/RMRule;

.field protected ruleId:I

.field protected successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;


# direct methods
.method public constructor <init>(ILcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p1, "ruleId"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p4, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 39
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    .line 40
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .line 41
    iput p1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->ruleId:I

    .line 42
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->activeDeviceList:Ljava/util/List;

    .line 43
    return-void
.end method


# virtual methods
.method protected getRequestedState()I
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x1

    return v0
.end method

.method protected restorePreviousState(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 2
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 89
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/belkin/wemo/rules/data/RMRule;->setState(I)V

    .line 90
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMUserRules;->setTempDBRuleToEditOrDelete(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 91
    return-void
.end method

.method public run()V
    .locals 5

    .prologue
    .line 48
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->activeDeviceList:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;Ljava/util/List;)V

    .line 49
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable$RMFetchBeforeEnableCallback;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;

    sget-object v3, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget v4, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->ruleId:I

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRulesType(I)I

    move-result v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMEnableRuleRunnable;->activeDeviceList:Ljava/util/List;

    invoke-direct {v2, v0, v0, v3, v4}, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;-><init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;ILjava/util/List;)V

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 50
    return-void
.end method
