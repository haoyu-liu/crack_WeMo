.class public Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;
.super Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;
.source "RMUpdateRulesRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private rulesType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const-class v0, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;ILjava/util/List;)V
    .locals 0
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;
    .param p3, "rulesType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p4, "activeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-direct {p0, p1, p2, p4}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;-><init>(Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;Ljava/util/List;)V

    .line 21
    iput p3, p0, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;->rulesType:I

    .line 22
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 27
    sget-object v1, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;->TAG:Ljava/lang/String;

    const-string v2, "Fetch Rules: fetching rules from all uPnP devices."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    invoke-direct {v0, p0, v1, v2}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    .line 29
    .local v0, "fetchCallback":Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;
    sget-object v1, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;

    iget v2, p0, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;->rulesType:I

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMUpdateRulesRunnable;->activeDeviceList:Ljava/util/List;

    invoke-virtual {v1, v0, v0, v2, v3}, Lcom/belkin/wemo/rules/fetch/RMFetchRulesManager;->fetchRules(Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;ILjava/util/List;)V

    .line 30
    return-void
.end method
