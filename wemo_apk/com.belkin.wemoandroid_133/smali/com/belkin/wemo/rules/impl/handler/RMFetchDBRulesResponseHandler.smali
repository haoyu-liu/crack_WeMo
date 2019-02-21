.class public Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;
.super Ljava/lang/Object;
.source "RMFetchDBRulesResponseHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private activeRulDBDevicesCount:I

.field private context:Landroid/content/Context;

.field private errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

.field private fetchCompleteCount:I

.field private latestDBPathSB:Ljava/lang/StringBuilder;

.field private latestDBVersion:I

.field private latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

.field private lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

.field private successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-class v0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;
    .param p4, "activeRuleDBDevicesCount"    # I

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput p4, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->activeRulDBDevicesCount:I

    .line 48
    iput-object p3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    .line 49
    iput-object p2, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    .line 55
    iput-object p1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->context:Landroid/content/Context;

    .line 57
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/RMRulesSDK;->getDependencyProvider()Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/belkin/wemo/rules/RMIRulesDependencyProvider;->provideIRulesUtils()Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 58
    return-void
.end method

.method private downloadLatestDeviceDBToApp(Ljava/lang/String;)V
    .locals 4
    .param p1, "latestDeviceDBPath"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-object v2, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 106
    .local v0, "deviceInfoWithLatestDB":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;-><init>(Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    .line 107
    .local v1, "request":Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 108
    return-void
.end method

.method private onLatestDeviceDBCalculated()V
    .locals 6

    .prologue
    .line 111
    sget-object v3, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    const-string v4, "Fetch Rules: response received for all devices"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    const-string v2, ""

    .line 114
    .local v2, "pragmaUserVersion":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBVerion()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "dBVersionInApp":Ljava/lang/String;
    sget-object v3, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Latest Device DB Version = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    sget-object v3, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: DB Version In App = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    sget-object v3, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Latest device DB path: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    iget v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    if-eqz v3, :cond_0

    iget v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-gt v3, v4, :cond_1

    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->doesRulesDBFileExist()Z

    move-result v3

    if-nez v3, :cond_3

    .line 127
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 129
    .local v1, "latestDBPath":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 131
    sget-object v3, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Setting new App DB Version to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    iget v4, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->setRulesDBVersion(Ljava/lang/String;)V

    .line 135
    invoke-direct {p0, v1}, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->downloadLatestDeviceDBToApp(Ljava/lang/String;)V

    .line 153
    .end local v1    # "latestDBPath":Ljava/lang/String;
    :goto_0
    return-void

    .line 137
    .restart local v1    # "latestDBPath":Ljava/lang/String;
    :cond_2
    new-instance v3, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v4, -0x191

    const-string v5, "Invalid Device DB Path"

    invoke-direct {v3, v4, v5}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-direct {p0, v3}, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->sendError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_0

    .line 139
    .end local v1    # "latestDBPath":Ljava/lang/String;
    :cond_3
    iget v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    if-nez v3, :cond_4

    .line 140
    sget-object v3, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Setting new App DB Version to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    const-string v4, "0"

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->setRulesDBVersion(Ljava/lang/String;)V

    .line 144
    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->deleteRulesDBFileInApp()Z

    .line 147
    const-string v3, ""

    iget v4, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    iget-object v5, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-direct {p0, v3, v4, v5}, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->sendSuccessResponse(Ljava/lang/String;ILjava/util/ArrayList;)V

    goto :goto_0

    .line 150
    :cond_4
    const-string v2, ""

    .line 151
    iget v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    iget-object v4, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-direct {p0, v2, v3, v4}, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->sendSuccessResponse(Ljava/lang/String;ILjava/util/ArrayList;)V

    goto :goto_0
.end method

.method private sendError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 156
    sget-object v0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch Rules: ERROR: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    iget-object v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    invoke-interface {v0}, Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;->onError()V

    .line 160
    :cond_0
    return-void
.end method

.method private sendSuccessResponse(Ljava/lang/String;ILjava/util/ArrayList;)V
    .locals 1
    .param p1, "pragmaUserVersion"    # Ljava/lang/String;
    .param p2, "latestDBVersion"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 165
    .local p3, "outOfSyncDeviceUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;

    invoke-interface {v0, p1, p2, p3}, Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;->onSuccess(Ljava/lang/String;ILjava/util/ArrayList;)V

    .line 168
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    .prologue
    .line 93
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    .line 95
    sget-object v0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fetch Rules: fetch ERROR for device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->getDeviceUdn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n Total device fetched count yet: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    iget v0, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->activeRulDBDevicesCount:I

    if-ne v0, v1, :cond_0

    .line 99
    invoke-direct {p0}, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->onLatestDeviceDBCalculated()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    :cond_0
    monitor-exit p0

    return-void

    .line 93
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onRequestComplete(ZI[B)V
    .locals 3
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 174
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->context:Landroid/content/Context;

    invoke-static {p3, v1, v2}, Lcom/belkin/rules/utils/RuleUtility;->downloadFromUrl([BLjava/lang/String;Landroid/content/Context;)V

    .line 176
    new-instance v1, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v2, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 177
    const-string v1, ""

    iget-object v2, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-direct {p0, v1, p2, v2}, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->sendSuccessResponse(Ljava/lang/String;ILjava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    :cond_0
    :goto_0
    return-void

    .line 178
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    if-eqz v1, :cond_0

    .line 181
    iget-object v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    invoke-interface {v1}, Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;->onError()V

    goto :goto_0
.end method

.method public declared-synchronized onSuccess(ILjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "dbVersion"    # I
    .param p2, "dbPath"    # Ljava/lang/String;
    .param p3, "deviceUDN"    # Ljava/lang/String;

    .prologue
    .line 62
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    if-ge v1, p1, :cond_3

    .line 65
    iget-object v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 66
    .local v0, "deviceToBeSynedUDN":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 67
    iget-object v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    sget-object v1, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: Device UDN with older versions of DB to be synced: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    :cond_0
    iput p1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    .line 72
    iget-object v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    invoke-virtual {v1, v2, v3, p3}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    iget-object v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    invoke-virtual {v1, v2, v3, p2}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .end local v0    # "deviceToBeSynedUDN":Ljava/lang/String;
    :cond_1
    :goto_0
    iget v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    .line 81
    sget-object v1, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: fetch SUCCESS for device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n DB Version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; DB Path: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n Total device fetched count yet: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    iget v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    iget v2, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->activeRulDBDevicesCount:I

    if-ne v1, v2, :cond_2

    .line 86
    invoke-direct {p0}, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->onLatestDeviceDBCalculated()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    :cond_2
    monitor-exit p0

    return-void

    .line 75
    :cond_3
    :try_start_1
    iget v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    if-le v1, p1, :cond_1

    .line 76
    sget-object v1, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: Device UDN with older versions of DB to be synced, (if required) : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object v1, p0, Lcom/belkin/wemo/rules/impl/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 62
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
