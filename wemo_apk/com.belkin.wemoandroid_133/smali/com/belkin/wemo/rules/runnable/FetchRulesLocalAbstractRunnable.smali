.class public abstract Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;
.super Ljava/lang/Object;
.source "FetchRulesLocalAbstractRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;


# static fields
.field public static final DB_DOWNLOAD_EXCEPTION:Ljava/lang/String; = "DB Download failed."

.field public static final INVALID_DB_PATH_EXCEPTION:Ljava/lang/String; = "Invalid Device DB Path"

.field public static final TAG:Ljava/lang/String; = "FetchRulesLocalAbstractRunnable"


# instance fields
.field protected context:Landroid/content/Context;

.field private devicesCount:I

.field private devicesFetchReceivedCount:I

.field private latestDBLatch:Ljava/util/concurrent/CountDownLatch;

.field private latestDBPathSB:Ljava/lang/StringBuilder;

.field private latestDBVersion:I

.field private latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

.field private lock:Ljava/lang/Object;

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


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->context:Landroid/content/Context;

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBPathSB:Ljava/lang/StringBuilder;

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    .line 99
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->lock:Ljava/lang/Object;

    .line 101
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    .line 102
    return-void
.end method

.method private downloadLatestDeviceDBToApp(Ljava/lang/String;Lcom/belkin/utils/RuleUtility;)Ljava/lang/String;
    .locals 4
    .param p1, "latestDeviceDBPath"    # Ljava/lang/String;
    .param p2, "ruleUtility"    # Lcom/belkin/utils/RuleUtility;

    .prologue
    .line 215
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    .line 217
    .local v0, "pragmaUserVersion":Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 218
    const-string v1, "pluginrulesCompressed.zip"

    invoke-virtual {p2, p1, v1}, Lcom/belkin/utils/RuleUtility;->DownloadFromUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 222
    :goto_0
    return-object v0

    .line 220
    :cond_0
    const-string v1, "FetchRulesLocalAbstractRunnable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: Latest Device DB Path invalid. Path: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private onLatestDeviceDBCalculated()V
    .locals 8

    .prologue
    .line 273
    const-string v5, "FetchRulesLocalAbstractRunnable"

    const-string v6, "Fetch Rules: response received for all devices"

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    new-instance v3, Lcom/belkin/utils/RuleUtility;

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->context:Landroid/content/Context;

    invoke-direct {v3, v5}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 276
    .local v3, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2}, Ljava/lang/String;-><init>()V

    .line 277
    .local v2, "pragmaUserVersion":Ljava/lang/String;
    new-instance v4, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->context:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 278
    .local v4, "sharePreferences":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getDBVersion()Ljava/lang/String;

    move-result-object v0

    .line 280
    .local v0, "dBVersionInApp":Ljava/lang/String;
    const-string v5, "FetchRulesLocalAbstractRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fetch Rules: Latest Device DB Version = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    const-string v5, "FetchRulesLocalAbstractRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fetch Rules: DB Version In App = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const-string v5, "FetchRulesLocalAbstractRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fetch Rules: Latest device DB path: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    iget v5, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    if-eqz v5, :cond_0

    iget v5, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-gt v5, v6, :cond_1

    :cond_0
    invoke-static {}, Lcom/belkin/utils/RuleUtility;->doesRulesDBFileExist()Z

    move-result v5

    if-nez v5, :cond_4

    .line 291
    :cond_1
    iget-object v5, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 293
    .local v1, "latestDBPath":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 295
    const-string v5, "FetchRulesLocalAbstractRunnable"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fetch Rules: Setting new App DB Version to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    iget v5, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 299
    invoke-direct {p0, v1, v3}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->downloadLatestDeviceDBToApp(Ljava/lang/String;Lcom/belkin/utils/RuleUtility;)Ljava/lang/String;

    move-result-object v2

    .line 300
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 302
    new-instance v5, Ljava/lang/Exception;

    const-string v6, "DB Download failed."

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->sendError(Ljava/lang/Exception;)V

    .line 313
    .end local v1    # "latestDBPath":Ljava/lang/String;
    :cond_2
    :goto_0
    iget v5, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    iget-object v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-virtual {p0, v2, v5, v6}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->sendSuccessResponse(Ljava/lang/String;ILjava/util/ArrayList;)V

    .line 314
    return-void

    .line 305
    .restart local v1    # "latestDBPath":Ljava/lang/String;
    :cond_3
    new-instance v5, Ljava/lang/Exception;

    const-string v6, "Invalid Device DB Path"

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->sendError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 310
    .end local v1    # "latestDBPath":Ljava/lang/String;
    :cond_4
    invoke-virtual {v3}, Lcom/belkin/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private recreateControlPointDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/cybergarage/upnp/Device;
    .locals 4
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 183
    const-string v1, "FetchRulesLocalAbstractRunnable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: Recreating control point device for UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 185
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    const-string v2, "WEMO00"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 186
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/belkin/wemo/cache/utils/WemoUtils;->createSSDPPacket(Ljava/lang/String;ILjava/lang/String;)Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lorg/cybergarage/upnp/ControlPoint;->searchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;ZZ)V

    .line 188
    :cond_0
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    return-object v1
.end method

.method private waitForFetchingRulesFromDevices()V
    .locals 5

    .prologue
    .line 194
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBLatch:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v2, 0x30d4

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 195
    const-string v1, "FetchRulesLocalAbstractRunnable"

    const-string v2, "Fetch rules: Latch count down completed in time."

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    :goto_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->onLatestDeviceDBCalculated()V

    .line 205
    :goto_1
    return-void

    .line 197
    :cond_0
    const-string v1, "FetchRulesLocalAbstractRunnable"

    const-string v2, "Fetch Rules: TIMEOUT during wait for fetch rules from all devices. Timeout duration: 12500"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v1, "FetchRulesLocalAbstractRunnable"

    const-string v2, "Exception while awaiting latch countdown: "

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 203
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->sendError(Ljava/lang/Exception;)V

    goto :goto_1
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V
    .locals 4
    .param p1, "error"    # Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    .prologue
    .line 231
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 232
    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    .line 233
    const-string v0, "FetchRulesLocalAbstractRunnable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: fetch ERROR for device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;->getDeviceUdn()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n Total device fetched count yet: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 236
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 237
    return-void

    .line 235
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onSuccess(ILjava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "dbVersion"    # I
    .param p2, "dbPath"    # Ljava/lang/String;
    .param p3, "deviceUDN"    # Ljava/lang/String;

    .prologue
    .line 245
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 246
    :try_start_0
    iget v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    if-ge v1, p1, :cond_2

    .line 249
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 250
    .local v0, "deviceToBeSynedUDN":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 251
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    const-string v1, "FetchRulesLocalAbstractRunnable"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fetch Rules: Device UDN with older versions of DB to be synced: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", version: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    :cond_0
    iput p1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    .line 256
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersionDeviceUDN:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    invoke-virtual {v1, v3, v4, p3}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBPathSB:Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBPathSB:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    invoke-virtual {v1, v3, v4, p2}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .end local v0    # "deviceToBeSynedUDN":Ljava/lang/String;
    :cond_1
    :goto_0
    iget v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    .line 265
    const-string v1, "FetchRulesLocalAbstractRunnable"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fetch Rules: fetch SUCCESS for device: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n DB Version: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; DB Path: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n Total device fetched count yet: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 270
    return-void

    .line 259
    :cond_2
    :try_start_1
    iget v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBVersion:I

    if-le v1, p1, :cond_1

    .line 260
    const-string v1, "FetchRulesLocalAbstractRunnable"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fetch Rules: Device UDN with older versions of DB to be synced, (if required) : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", version: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->lowerDBVersionDeviceUDNsList:Ljava/util/ArrayList;

    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 268
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public run()V
    .locals 10

    .prologue
    .line 111
    iget-object v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->context:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/utils/WeMoUtils;->getWiFiDeviceList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 112
    .local v2, "deviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    iput v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesCount:I

    .line 114
    const-string v6, "FetchRulesLocalAbstractRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Fetch Rules: Total upnp devices count = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesCount:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    new-instance v6, Ljava/util/concurrent/CountDownLatch;

    iget v7, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesCount:I

    invoke-direct {v6, v7}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBLatch:Ljava/util/concurrent/CountDownLatch;

    .line 118
    const/4 v4, 0x0

    .line 119
    .local v4, "fetchRulesSentCount":I
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 120
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v6, "FetchRulesLocalAbstractRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Time: Fetch Rules local runnable: Runtime IN : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 123
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_1

    .line 124
    const-string v6, "FetchRulesLocalAbstractRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Fetch Rules: Device: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " IS AVAILABLE"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    new-instance v6, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;

    invoke-direct {v6}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;-><init>()V

    invoke-virtual {v6, v1}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->getDeviceRulesInstance(Lorg/cybergarage/upnp/Device;)Lcom/belkin/wemo/rules/device/IDeviceRules;

    move-result-object v3

    .line 126
    .local v3, "deviceRules":Lcom/belkin/wemo/rules/device/IDeviceRules;
    if-eqz v3, :cond_0

    .line 127
    invoke-interface {v3, v1, p0}, Lcom/belkin/wemo/rules/device/IDeviceRules;->fetchDeviceRulesData(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;)V

    .line 128
    add-int/lit8 v4, v4, 0x1

    .line 165
    .end local v3    # "deviceRules":Lcom/belkin/wemo/rules/device/IDeviceRules;
    :goto_1
    const-string v6, "FetchRulesLocalAbstractRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Time: Fetch Rules local runnable: Runtime OUT : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 132
    .restart local v3    # "deviceRules":Lcom/belkin/wemo/rules/device/IDeviceRules;
    :cond_0
    iget v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    .line 133
    const-string v6, "FetchRulesLocalAbstractRunnable"

    const-string v7, "Fetch Rules: Latch count down by 1 as Device NOT valid for Fetch uPnP action to be sent."

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    iget-object v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v6}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_1

    .line 139
    .end local v3    # "deviceRules":Lcom/belkin/wemo/rules/device/IDeviceRules;
    :cond_1
    invoke-direct {p0, v0}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->recreateControlPointDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 140
    if-eqz v1, :cond_3

    .line 141
    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDevice(Lorg/cybergarage/upnp/Device;)V

    .line 144
    const-string v6, "FetchRulesLocalAbstractRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Fetch Rules: Device: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " IS AVAILABLE"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    new-instance v6, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;

    invoke-direct {v6}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;-><init>()V

    invoke-virtual {v6, v1}, Lcom/belkin/wemo/rules/device/impl/DeviceRulesFactory;->getDeviceRulesInstance(Lorg/cybergarage/upnp/Device;)Lcom/belkin/wemo/rules/device/IDeviceRules;

    move-result-object v3

    .line 146
    .restart local v3    # "deviceRules":Lcom/belkin/wemo/rules/device/IDeviceRules;
    if-eqz v3, :cond_2

    .line 147
    invoke-interface {v3, v1, p0}, Lcom/belkin/wemo/rules/device/IDeviceRules;->fetchDeviceRulesData(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;)V

    .line 148
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 152
    :cond_2
    iget v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    .line 153
    const-string v6, "FetchRulesLocalAbstractRunnable"

    const-string v7, "Fetch Rules: Latch count down by 1 as Device NOT valid for Fetch uPnP action to be sent."

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    iget-object v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v6}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto :goto_1

    .line 160
    .end local v3    # "deviceRules":Lcom/belkin/wemo/rules/device/IDeviceRules;
    :cond_3
    iget v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->devicesFetchReceivedCount:I

    .line 161
    const-string v6, "FetchRulesLocalAbstractRunnable"

    const-string v7, "Fetch Rules: Latch count down by 1 as Device is NULL so NO Fetch uPnP action sent."

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    iget-object v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->latestDBLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v6}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    goto/16 :goto_1

    .line 168
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_4
    const-string v6, "FetchRulesLocalAbstractRunnable"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Fetch Rules: Devices to which Fetch Rules is sent = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    if-nez v4, :cond_5

    .line 175
    iget-object v6, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->context:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->recreateControlPoint(Z)Z

    .line 176
    new-instance v6, Ljava/lang/Exception;

    const-string v7, "No device is online for rules processing."

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->sendError(Ljava/lang/Exception;)V

    .line 180
    :goto_2
    return-void

    .line 178
    :cond_5
    invoke-direct {p0}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;->waitForFetchingRulesFromDevices()V

    goto :goto_2
.end method

.method protected abstract sendError(Ljava/lang/Exception;)V
.end method

.method protected abstract sendSuccessResponse(Ljava/lang/String;ILjava/util/ArrayList;)V
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
.end method
