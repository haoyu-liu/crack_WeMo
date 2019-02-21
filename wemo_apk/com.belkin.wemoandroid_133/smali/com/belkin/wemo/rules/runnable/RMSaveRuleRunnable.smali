.class public Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMSaveRuleRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMStoreRuleCallback;,
        Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleComposerCallback;,
        Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMNewRuleConflictCallback;,
        Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;
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

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

.field private rule:Lcom/belkin/wemo/rules/data/RMRule;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/data/RMRule;Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            "Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;",
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
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    .line 39
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    .line 40
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    .line 41
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->activeDeviceList:Ljava/util/List;

    .line 42
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Lcom/belkin/wemo/rules/data/RMRule;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleSuccessCallback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMSaveRuleErrorCallback;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$700(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 48
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->activeDeviceList:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;Ljava/util/List;)V

    .line 49
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable$RMFetchBeforeSaveCallback;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->rule:Lcom/belkin/wemo/rules/data/RMRule;

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMSaveRuleRunnable;->activeDeviceList:Ljava/util/List;

    invoke-direct {v2, v0, v0, v3, v4}, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;-><init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;ILjava/util/List;)V

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 50
    return-void
.end method
