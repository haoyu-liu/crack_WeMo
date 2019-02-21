.class public Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;
.super Ljava/lang/Object;
.source "RMFetchDBRulesResponseHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
.implements Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;
.implements Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private activeRulDBDevicesCount:I

.field private errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

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

.field private successCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;ILcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 1
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;
    .param p3, "activeRuleDBDevicesCount"    # I
    .param p4, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput p3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->activeRulDBDevicesCount:I

    .line 48
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

    .line 49
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;

    .line 50
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    .line 56
    return-void
.end method

.method private downloadLatestDeviceDBToApp(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "latestDeviceDBPath"    # Ljava/lang/String;
    .param p2, "deviceIdentifier"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x2

    const/4 v8, -0x1

    .line 117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 118
    .local v0, "dataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "download_location"

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v4}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getDBFilePathWithNameInApp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    const-string v3, "download_url"

    invoke-virtual {v0, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    const-string v3, "mac_address"

    invoke-virtual {v0, v3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadFactory;->getRulesDBDownloaderInstance()Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;

    move-result-object v1

    .line 124
    .local v1, "downloader":Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    if-eqz v1, :cond_1

    .line 125
    invoke-interface {v1, v0, p0, p0}, Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;->downloadRulesDB(Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;)V

    .line 141
    .end local v1    # "downloader":Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    :cond_0
    :goto_0
    return-void

    .line 127
    .restart local v1    # "downloader":Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

    if-eqz v3, :cond_0

    .line 128
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/4 v5, -0x1

    const-string v6, "Error during register/unregister Push Notification!"

    const/4 v7, 0x2

    invoke-direct {v4, v5, v6, v7}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;->onSingleTypeRulesFetchError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V
    :try_end_0
    .catch Lcom/belkin/wemo/exception/InvalidArgumentsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 133
    .end local v1    # "downloader":Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
    :catch_0
    move-exception v2

    .line 134
    .local v2, "e":Lcom/belkin/wemo/exception/InvalidArgumentsException;
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    const-string v4, "Fetch Rules: InvalidArgumentsException while downloading DB file: "

    invoke-static {v3, v4, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 135
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

    if-eqz v3, :cond_0

    .line 136
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    invoke-virtual {v2}, Lcom/belkin/wemo/exception/InvalidArgumentsException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v8, v5, v9}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;->onSingleTypeRulesFetchError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    goto :goto_0
.end method

.method private getDeviceMAC(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 204
    const-string v1, ""

    .line 205
    .local v1, "mac":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v2, p1}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getDeviceInformationByUDNFromMemory(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 206
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 207
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v1

    .line 209
    :cond_0
    return-object v1
.end method

.method private onLatestDeviceDBCalculated()V
    .locals 8

    .prologue
    .line 145
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    const-string v4, "Fetch Rules: response received for all devices"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBVerion()Ljava/lang/String;

    move-result-object v0

    .line 149
    .local v0, "dBVersionInApp":Ljava/lang/String;
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Latest Device DB Version = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

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

    .line 151
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Latest device DB path: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->doesRulesDBFileExist()Z

    move-result v1

    .line 153
    .local v1, "doesDBFileExist":Z
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Does Rules DB file exist in app: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    if-eqz v3, :cond_4

    .line 163
    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-gt v3, v4, :cond_0

    if-nez v1, :cond_3

    .line 168
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 170
    .local v2, "latestDBPath":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 172
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Setting new App DB Version to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    iget v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->setRulesDBVersion(Ljava/lang/String;)V

    .line 176
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->getDeviceMAC(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->downloadLatestDeviceDBToApp(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .end local v2    # "latestDBPath":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 178
    .restart local v2    # "latestDBPath":Ljava/lang/String;
    :cond_2
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    const-string v4, "Fetch Rules: ERROR: Invalid Device DB Path"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

    if-eqz v3, :cond_1

    .line 180
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/16 v5, -0x191

    const-string v6, "Invalid Device DB Path"

    const/4 v7, 0x2

    invoke-direct {v4, v5, v6, v7}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;->onSingleTypeRulesFetchError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    goto :goto_0

    .line 187
    .end local v2    # "latestDBPath":Ljava/lang/String;
    :cond_3
    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-direct {p0, v3, v4}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->sendSuccessResponse(ILjava/util/ArrayList;)V

    goto :goto_0

    .line 192
    :cond_4
    sget-object v3, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Fetch Rules: Setting new App DB Version to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    const-string v4, "0"

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->setRulesDBVersion(Ljava/lang/String;)V

    .line 196
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->deleteRulesDBFileInApp()Z

    .line 199
    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    iget-object v4, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-direct {p0, v3, v4}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->sendSuccessResponse(ILjava/util/ArrayList;)V

    goto :goto_0
.end method

.method private sendSuccessResponse(ILjava/util/ArrayList;)V
    .locals 5
    .param p1, "latestDBVersion"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 213
    .local p2, "outOfSyncDeviceUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->successCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;

    const/4 v1, 0x2

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, p2, v2}, Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;->onSingleTypeRulesFetched(ILjava/util/ArrayList;[Ljava/lang/String;)V

    .line 216
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V
    .locals 3
    .param p1, "error"    # Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    .prologue
    .line 105
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    .line 107
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

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

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->activeRulDBDevicesCount:I

    if-ne v0, v1, :cond_0

    .line 111
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->onLatestDeviceDBCalculated()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    :cond_0
    monitor-exit p0

    return-void

    .line 105
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onRulesDBDownloadException(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 226
    sget-object v0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    const-string v1, "Exception while downloading DB: "

    invoke-static {v0, v1, p1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 228
    const-class v0, Ljava/io/FileNotFoundException;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    if-nez v0, :cond_1

    .line 230
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->sendSuccessResponse(ILjava/util/ArrayList;)V

    .line 238
    :cond_0
    :goto_0
    return-void

    .line 232
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

    if-eqz v0, :cond_0

    .line 233
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    const/4 v2, -0x1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-direct {v1, v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;-><init>(ILjava/lang/String;I)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;->onSingleTypeRulesFetchError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V

    goto :goto_0
.end method

.method public onRulesDBDownloaded(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 221
    iget v0, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->sendSuccessResponse(ILjava/util/ArrayList;)V

    .line 222
    return-void
.end method

.method public declared-synchronized onSuccess(ILjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "dbVersion"    # I
    .param p2, "dbPath"    # Ljava/lang/String;
    .param p3, "deviceUDN"    # Ljava/lang/String;

    .prologue
    .line 60
    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: Response received for UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", dbVersion in Device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; latest dbVersion Yet received: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; dbPath in Device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; latest dbPath yet received: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    if-lt v1, p1, :cond_2

    .line 74
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 75
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    invoke-virtual {v1, v2, v3, p2}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    :cond_0
    :goto_0
    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    .line 93
    sget-object v1, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

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

    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->fetchCompleteCount:I

    iget v2, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->activeRulDBDevicesCount:I

    if-ne v1, v2, :cond_1

    .line 98
    invoke-direct {p0}, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->onLatestDeviceDBCalculated()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    :cond_1
    monitor-exit p0

    return-void

    .line 77
    :cond_2
    :try_start_1
    iget v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    if-ge v1, p1, :cond_0

    .line 80
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, "deviceToBeSynedUDN":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 82
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    sget-object v1, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->TAG:Ljava/lang/String;

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

    iget v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    :cond_3
    iput p1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersion:I

    .line 87
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    invoke-virtual {v1, v2, v3, p3}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/handler/RMFetchDBRulesResponseHandler;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    invoke-virtual {v1, v2, v3, p2}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 60
    .end local v0    # "deviceToBeSynedUDN":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
