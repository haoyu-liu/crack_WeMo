.class public Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMDeleteRuleRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$1;,
        Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMStoreRuleCallback;,
        Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMDeleteRuleComposerCallback;,
        Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;
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

.field private deletedRule:Lcom/belkin/wemo/rules/data/RMRule;

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

.field private ruleId:I

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;


# direct methods
.method public constructor <init>(ILcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p1, "ruleId"    # I
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p4, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 38
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

    .line 39
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    .line 40
    iput p1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->ruleId:I

    .line 41
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->activeDeviceList:Ljava/util/List;

    .line 42
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->deletedRule:Lcom/belkin/wemo/rules/data/RMRule;

    return-object v0
.end method

.method static synthetic access$102(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;
    .param p1, "x1"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->deletedRule:Lcom/belkin/wemo/rules/data/RMRule;

    return-object p1
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)I
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    .prologue
    .line 29
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->ruleId:I

    return v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleErrorCallback;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMDeleteRuleSuccessCallback;

    return-object v0
.end method

.method static synthetic access$500(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;
    .param p1, "x1"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->revertRuleState(Lcom/belkin/wemo/rules/data/RMRule;)V

    return-void
.end method

.method private revertRuleState(Lcom/belkin/wemo/rules/data/RMRule;)V
    .locals 2
    .param p1, "deletedRule"    # Lcom/belkin/wemo/rules/data/RMRule;

    .prologue
    .line 120
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/data/RMUserRules;->setTempDBRuleToEditOrDelete(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 121
    sget-object v0, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/rules/data/RMUserRules;->addRule(Lcom/belkin/wemo/rules/data/RMRule;)V

    .line 122
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 47
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->activeDeviceList:Ljava/util/List;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;Ljava/util/List;Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$1;)V

    .line 48
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable$RMFetchBeforeDeleteCallback;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;

    sget-object v3, Lcom/belkin/wemo/rules/data/RMUserRules;->INSTANCE:Lcom/belkin/wemo/rules/data/RMUserRules;

    iget v4, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->ruleId:I

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/rules/data/RMUserRules;->getRulesType(I)I

    move-result v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMDeleteRuleRunnable;->activeDeviceList:Ljava/util/List;

    invoke-direct {v2, v0, v0, v3, v4}, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;-><init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;ILjava/util/List;)V

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 49
    return-void
.end method
