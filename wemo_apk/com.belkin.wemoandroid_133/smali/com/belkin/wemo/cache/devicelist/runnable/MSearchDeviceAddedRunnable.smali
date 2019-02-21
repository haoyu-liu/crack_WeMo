.class public Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "MSearchDeviceAddedRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;,
        Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;
    }
.end annotation


# static fields
.field public static final COOLING_PERIOD_TILL_NEXT_MSEARCH:I = 0x2710


# instance fields
.field private activity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

.field private cacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private context:Landroid/content/Context;

.field private device:Lorg/cybergarage/upnp/Device;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

.field private listener:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

.field private sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/CacheManager;Lcom/belkin/wemo/cache/data/DevicesArray;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/utils/SharePreferences;Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;)V
    .locals 2
    .param p1, "cacheManager"    # Lcom/belkin/wemo/cache/CacheManager;
    .param p2, "devicesArray"    # Lcom/belkin/wemo/cache/data/DevicesArray;
    .param p3, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p4, "sharePreferences"    # Lcom/belkin/wemo/cache/utils/SharePreferences;
    .param p5, "activity"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;
    .param p6, "context"    # Landroid/content/Context;
    .param p7, "device"    # Lorg/cybergarage/upnp/Device;
    .param p8, "listener"    # Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 53
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 54
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 55
    iput-object p7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->device:Lorg/cybergarage/upnp/Device;

    .line 56
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 57
    iput-object p6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->context:Landroid/content/Context;

    .line 58
    iput-object p5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->activity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    .line 60
    iput-object p8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->listener:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

    .line 61
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public onDeviceNotReachable()V
    .locals 6

    .prologue
    .line 160
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceNonReachibility(Z)V

    .line 161
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, "udn":Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Discovery: MSearch device is NOT reachable via UNICAST: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; NO PROCESSING TO BE DONE. Starting cooling period untill next MSearch. Time: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2710

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    new-instance v2, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->listener:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

    invoke-direct {v2, p0, v0, v3}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$DeviceCoolingPeriodTimerTask;-><init>(Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;)V

    const-wide/16 v4, 0x2710

    invoke-virtual {v1, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 164
    return-void
.end method

.method public onDeviceReachable()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 75
    const/4 v3, 0x0

    .line 76
    .local v3, "isUpdate":Z
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    .line 78
    .local v7, "udn":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery: MSearch device is reachable via UNICAST: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    if-eqz v7, :cond_5

    .line 80
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v8, v7, v11}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    .line 81
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v8, v7}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 82
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-nez v0, :cond_6

    .line 83
    new-instance v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-direct {v0, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Lorg/cybergarage/upnp/Device;)V

    .line 89
    .restart local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :goto_0
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->subscribeToService(Lorg/cybergarage/upnp/Device;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 90
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery: MSearch Device Added: subscribe to service failed for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    :cond_0
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getLogoURLFromDevice()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconURL(Ljava/lang/String;)V

    .line 94
    invoke-virtual {v0, v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 95
    invoke-virtual {v0, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 96
    invoke-virtual {v0, v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setRemote(Z)V

    .line 97
    invoke-virtual {v0, v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setHide(I)V

    .line 99
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v8, v0, v3}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 100
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 102
    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/IsDevice;->Bridge(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 103
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery: MSearch Device Added: initiating zigbee scan: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initiateScanZigBeeDevice(Ljava/lang/String;)V

    .line 107
    :cond_1
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->processFWUpgradeStatus(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 109
    if-nez v3, :cond_7

    .line 110
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery: MSearch Device Added: going to send ADD notification for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "add"

    const-string v10, ""

    invoke-virtual {v8, v9, v10, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    :goto_1
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v8, v7}, Lcom/belkin/wemo/cache/CacheManager;->isDeviceInDB(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_8

    .line 118
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery: MSearch Device Added: ADDING device in cache db: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, " info: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInfo()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    if-eqz v0, :cond_2

    .line 122
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v8, v0, v11, v11, v11}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    move-result v5

    .line 123
    .local v5, "result":Z
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery: MSearch Device Added: device added to db "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " result:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .end local v5    # "result":Z
    :cond_2
    :goto_2
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getRemoteAutoEnableNeeded()Z

    move-result v1

    .line 133
    .local v1, "isRemoteAccessEnableNeeded":Z
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v2

    .line 134
    .local v2, "isRemoteEnabled":Z
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery: Is remote access enable needed: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; Is remote enabled: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    if-eqz v1, :cond_3

    if-nez v2, :cond_3

    .line 136
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    const-string v9, "Discovery: Enabling Auto Remote Access"

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    new-instance v6, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->activity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->context:Landroid/content/Context;

    invoke-direct {v6, v8, v9}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)V

    .line 138
    .local v6, "rmgr":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
    invoke-virtual {v6}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->enableRemoteAccess()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 139
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v8, v12}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V

    .line 143
    .end local v6    # "rmgr":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
    :cond_3
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->listener:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

    if-eqz v8, :cond_4

    .line 144
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->listener:Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;

    invoke-interface {v8, v0}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;->onMSearchProcessingDone(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 147
    :cond_4
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 149
    new-instance v4, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 150
    .local v4, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v8, "cache.db"

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->context:Landroid/content/Context;

    invoke-virtual {v4, v8, v9}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 153
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "isRemoteAccessEnableNeeded":Z
    .end local v2    # "isRemoteEnabled":Z
    .end local v4    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_5
    return-void

    .line 85
    .restart local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_6
    const/4 v3, 0x1

    .line 86
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDevice(Lorg/cybergarage/upnp/Device;)V

    goto/16 :goto_0

    .line 113
    :cond_7
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery: MSearch Device Added: going to send UPDATE notification for "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "update"

    const-string v10, ""

    invoke-virtual {v8, v9, v10, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 126
    :cond_8
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Discovery: MSearch Device Added: UPDATING device in cache db: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v8, v0, v11, v11, v11}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto/16 :goto_2
.end method

.method public run()V
    .locals 4

    .prologue
    .line 65
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Discovery: Processing MSearch New Device Added Request: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    new-instance v0, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-direct {v0, v1, p0}, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;-><init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester$IDeviceReachabilityListener;)V

    .line 69
    .local v0, "tester":Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/DeviceReachabilityTester;->start()V

    .line 70
    return-void
.end method
