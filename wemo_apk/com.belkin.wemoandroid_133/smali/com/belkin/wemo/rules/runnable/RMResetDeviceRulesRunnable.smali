.class public Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMResetDeviceRulesRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMStoreRuleCallback;,
        Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;
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

.field private deviceUdn:Ljava/lang/String;

.field private errorCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p4, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 42
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;

    .line 43
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    .line 44
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->deviceUdn:Ljava/lang/String;

    .line 45
    iput-object p4, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->activeDeviceList:Ljava/util/List;

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->deviceUdn:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;

    return-object v0
.end method

.method static synthetic access$600(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;

    return-object v0
.end method

.method static synthetic access$700(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 50
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Reset Device Rules: FETCHING RULES"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->activeDeviceList:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;Ljava/util/List;)V

    .line 53
    .local v0, "callback":Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable$RMFetchBeforeEditCallback;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/RMResetDeviceRulesRunnable;->activeDeviceList:Ljava/util/List;

    invoke-direct {v2, v0, v0, v3, v4}, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;-><init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;ILjava/util/List;)V

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 54
    return-void
.end method
