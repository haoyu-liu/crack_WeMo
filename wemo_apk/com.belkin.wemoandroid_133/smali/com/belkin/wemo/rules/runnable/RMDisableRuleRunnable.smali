.class public Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMDisableRuleRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMStoreRuleCallback;,
        Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMToggleRuleComposerCallback;,
        Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;
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

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private ruleId:I

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;


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
    .line 35
    .local p4, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 36
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    .line 37
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    .line 38
    iput p1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->ruleId:I

    .line 39
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->activeDeviceList:Ljava/util/List;

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    return-object v0
.end method

.method static synthetic access$002(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;
    .param p1, "x1"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    return-object p1
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    .prologue
    .line 24
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->ruleId:I

    return v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleSuccessCallback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMToggleRuleErrorCallback;

    return-object v0
.end method


# virtual methods
.method protected getRequestedState()I
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method protected restorePreviousState(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 2
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 89
    const/4 v0, 0x1

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
    .line 45
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->activeDeviceList:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;Ljava/util/List;)V

    .line 46
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable$RMFetchBeforeEnableCallback;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;

    sget-object v3, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget v4, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->ruleId:I

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRulesType(I)I

    move-result v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMDisableRuleRunnable;->activeDeviceList:Ljava/util/List;

    invoke-direct {v2, v0, v0, v3, v4}, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;-><init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;ILjava/util/List;)V

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 47
    return-void
.end method
