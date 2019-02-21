.class public Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMSyncDBRulesNoStoreRemoteRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$1;,
        Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;,
        Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SetDBVersionResponse;
    }
.end annotation


# instance fields
.field protected devicesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field protected errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

.field protected params:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

.field protected succesCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;Ljava/util/List;Ljava/util/HashMap;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;
    .param p2, "succesCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;
    .param p5, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/util/RMIRulesUtils;",
            ")V"
        }
    .end annotation

    .prologue
    .line 36
    .local p3, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p4, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    .line 38
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteSuccessCallback;

    .line 40
    iput-object p3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->devicesList:Ljava/util/List;

    .line 41
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->params:Ljava/util/HashMap;

    .line 42
    iput-object p5, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 43
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->sendDBFileToCloud()V

    .line 48
    return-void
.end method

.method protected sendDBFileToCloud()V
    .locals 8

    .prologue
    .line 52
    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->params:Ljava/util/HashMap;

    const-string v5, "db_zip_file"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 53
    .local v0, "dbZIPFilePath":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 54
    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    if-eqz v4, :cond_0

    .line 55
    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;

    new-instance v5, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v5}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>()V

    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->devicesList:Ljava/util/List;

    const/4 v7, 0x1

    invoke-interface {v4, v5, v6, v7}, Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesRemoteErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;Ljava/util/List;I)V

    .line 65
    :cond_0
    :goto_0
    return-void

    .line 58
    :cond_1
    new-instance v4, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v5, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v5}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "homeId":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Store Rules (No Store): Sending RULES DB via remote to home ID = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    new-instance v3, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;

    new-instance v4, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$SendDBFileResponse;-><init>(Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable$1;)V

    iget-object v5, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v5, v0}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->readFile(Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {v3, v1, v4, v5}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;-><init>(Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;[B)V

    .line 62
    .local v3, "request":Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;
    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMSyncDBRulesNoStoreRemoteRunnable;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v4}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getCloudRequestManager()Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    move-result-object v2

    .line 63
    .local v2, "manager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_0
.end method
