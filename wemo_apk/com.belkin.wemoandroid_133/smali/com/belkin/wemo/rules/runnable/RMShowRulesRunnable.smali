.class public Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMShowRulesRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;,
        Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;,
        Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected activeDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field protected errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

.field protected successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;Ljava/util/List;)V
    .locals 0
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p3, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    .line 37
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .line 38
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->activeDeviceList:Ljava/util/List;

    .line 39
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 44
    sget-object v1, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Fetch Rules: fetching rules from all uPnP devices."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    invoke-direct {v0, p0, v1, v2}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    .line 46
    .local v0, "fetchCallback":Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;
    sget-object v1, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->activeDeviceList:Ljava/util/List;

    invoke-virtual {v1, v0, v0, v2}, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->fetchAndSyncRules(Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;Ljava/util/List;)V

    .line 47
    return-void
.end method
