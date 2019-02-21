.class public Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "UnicastDiscoveryRunnable.java"


# instance fields
.field private context:Landroid/content/Context;

.field private devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private deviceDiscoveryCloudCache:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/cache/cloud/SmartDiscovery;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceDiscoveryCloudCache"    # Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 27
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 28
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->context:Landroid/content/Context;

    .line 29
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->deviceDiscoveryCloudCache:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    .line 30
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;)Lcom/belkin/wemo/cache/cloud/SmartDiscovery;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->deviceDiscoveryCloudCache:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 34
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v8

    sget-object v9, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_UNICAST_DISOCVERY:Ljava/lang/Integer;

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/Locks;->setLock(Ljava/lang/Integer;)V

    .line 35
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->context:Landroid/content/Context;

    invoke-static {v8}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/CacheManager;->getInitialDeviceListGeneric()Ljava/util/List;

    move-result-object v1

    .line 36
    .local v1, "devList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery Unicast: Starting UnicastDiscoveryRunnable. DB Device List size: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 39
    .local v2, "devObj":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery Unicast: Full Device Info from DB: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    if-eqz v2, :cond_0

    .line 42
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    .line 43
    .local v7, "udn":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFwStatus()Ljava/lang/String;

    move-result-object v3

    .line 44
    .local v3, "fwStatus":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery Unicast: UDN: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; fwStatus: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 47
    const-string v8, "0"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    const-string v8, "1"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    const-string v8, "3"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 50
    :cond_1
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery Unicast: Unicast NOT ISSUED as FW UPGRADE IN PROGRESS. UDN: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->TAG:Ljava/lang/String;

    const-string v9, "FW Update: UnicastDiscoveryRunnable: Device is in FW upgrade."

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->printFwUpgradeInProgressMapIfDebug()V

    .line 56
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFWUpdateInProgressDataMap()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_0

    .line 57
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;-><init>()V

    .line 58
    .local v0, "data":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->setFwStatus(Ljava/lang/String;)V

    .line 59
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->setOldFwVersion(Ljava/lang/String;)V

    .line 60
    invoke-virtual {v0, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->setUdn(Ljava/lang/String;)V

    .line 61
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFWUpdateInProgressDataMap()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery Unicast: FW Update: Entry added into fwUpdateInProgressDataMap as none existed. UDN: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 67
    .end local v0    # "data":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
    :cond_2
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevicesStartTimes()Ljava/util/HashMap;

    move-result-object v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v8, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    new-instance v5, Ljava/lang/Thread;

    new-instance v8, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable$1;

    invoke-direct {v8, p0, v2}, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable$1;-><init>(Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    invoke-direct {v5, v8}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 77
    .local v5, "th":Ljava/lang/Thread;
    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/Thread;->setPriority(I)V

    .line 78
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 80
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getBinaryStateRequestTrackerMap()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;

    .line 81
    .local v6, "tracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    if-eqz v6, :cond_0

    .line 82
    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->reset()V

    .line 83
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "DeviceRequestTracker: counter reset to 0 after issuing UNICAST. UDN: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 87
    .end local v5    # "th":Ljava/lang/Thread;
    .end local v6    # "tracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    :cond_3
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;->TAG:Ljava/lang/String;

    const-string v9, "Unicast NOT Issued. Device Information object is NULL"

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 91
    .end local v2    # "devObj":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "fwStatus":Ljava/lang/String;
    .end local v7    # "udn":Ljava/lang/String;
    :cond_4
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v8

    sget-object v9, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_UNICAST_DISOCVERY:Ljava/lang/Integer;

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 92
    return-void
.end method
