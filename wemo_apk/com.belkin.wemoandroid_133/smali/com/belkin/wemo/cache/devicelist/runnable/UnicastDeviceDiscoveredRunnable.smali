.class public Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "UnicastDeviceDiscoveredRunnable.java"


# instance fields
.field private activity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

.field private cacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private context:Landroid/content/Context;

.field private dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

.field private mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

.field private sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/CacheManager;Lcom/belkin/wemo/cache/data/DevicesArray;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/cybergarage/upnp/ControlPoint;Ljava/lang/String;Lcom/belkin/wemo/cache/utils/SharePreferences;Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;)V
    .locals 2
    .param p1, "cacheManager"    # Lcom/belkin/wemo/cache/CacheManager;
    .param p2, "devicesArray"    # Lcom/belkin/wemo/cache/data/DevicesArray;
    .param p3, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p4, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p5, "controlPoint"    # Lorg/cybergarage/upnp/ControlPoint;
    .param p6, "deviceString"    # Ljava/lang/String;
    .param p7, "sharePreferences"    # Lcom/belkin/wemo/cache/utils/SharePreferences;
    .param p8, "context"    # Landroid/content/Context;
    .param p9, "activity"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 43
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 44
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 45
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 46
    iput-object p5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 47
    iput-object p7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 48
    iput-object p8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->context:Landroid/content/Context;

    .line 49
    iput-object p9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->activity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    .line 51
    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 56
    :try_start_0
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    .line 57
    .local v5, "udn":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unicast Discovery: Device Discovered Via Unicast: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v8, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 59
    .local v0, "device":Lorg/cybergarage/upnp/Device;
    if-nez v0, :cond_0

    .line 61
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v10

    invoke-static {v9, v10, v5}, Lcom/belkin/wemo/cache/utils/WemoUtils;->createSSDPPacket(Ljava/lang/String;ILjava/lang/String;)Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-virtual {v8, v9, v10, v11}, Lorg/cybergarage/upnp/ControlPoint;->searchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;ZZ)V

    .line 65
    :cond_0
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v8, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 66
    if-eqz v0, :cond_4

    .line 68
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDevice(Lorg/cybergarage/upnp/Device;)V

    .line 69
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unicast Discovery: Control Point device has been added for UDN: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    :goto_0
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->subscribeToService(Lorg/cybergarage/upnp/Device;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 75
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unicast Discovery: subscription failed : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    :cond_1
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getScanStartTime(Ljava/lang/String;)J

    move-result-wide v6

    .line 79
    .local v6, "scanStartTime":J
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v8, v6, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStartDiscoveryTime(J)V

    .line 80
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setEndDiscoveryTime(J)V

    .line 81
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAvailablity(Z)V

    .line 82
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 83
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 84
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v9, "(Unicast)"

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setWhichDiscovered(Ljava/lang/String;)V

    .line 86
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v10, 0x1

    invoke-virtual {v8, v9, v10}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 87
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v8, v9, v10}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    .line 88
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v9, "update"

    const-string v10, ""

    iget-object v11, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v9, v10, v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    invoke-static {v5}, Lcom/belkin/wemo/cache/utils/IsDevice;->Bridge(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 103
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unicast Discovery: initiating zigbee scan for bridge: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v8, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initiateScanZigBeeDevice(Ljava/lang/String;)V

    .line 107
    :cond_2
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const/4 v10, 0x1

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-virtual {v8, v9, v10, v11, v12}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 111
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getRemoteAutoEnableNeeded()Z

    move-result v2

    .line 112
    .local v2, "isRemoteAccessEnableNeeded":Z
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v3

    .line 113
    .local v3, "isRemoteEnabled":Z
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unicast Discovery: Is remote access enable needed: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; Is remote enabled: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    if-eqz v2, :cond_3

    if-nez v3, :cond_3

    .line 115
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    const-string v9, "Unicast Discovery: Enabling Auto Remote Access"

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    new-instance v4, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->activity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->context:Landroid/content/Context;

    invoke-direct {v4, v8, v9}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)V

    .line 117
    .local v4, "rmgr":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->enableRemoteAccess()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 118
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->sharePreferences:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V

    .line 124
    .end local v0    # "device":Lorg/cybergarage/upnp/Device;
    .end local v2    # "isRemoteAccessEnableNeeded":Z
    .end local v3    # "isRemoteEnabled":Z
    .end local v4    # "rmgr":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
    .end local v5    # "udn":Ljava/lang/String;
    .end local v6    # "scanStartTime":J
    :cond_3
    :goto_1
    return-void

    .line 71
    .restart local v0    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v5    # "udn":Ljava/lang/String;
    :cond_4
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unicast Discovery: Control Point device COULD NOT BE added for UDN: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 121
    .end local v0    # "device":Lorg/cybergarage/upnp/Device;
    .end local v5    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 122
    .local v1, "e":Ljava/lang/Exception;
    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;->TAG:Ljava/lang/String;

    const-string v9, "Exception: "

    invoke-static {v8, v9, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1
.end method
