.class public Lcom/belkin/wemo/cache/cloud/SmartDiscovery;
.super Ljava/lang/Object;
.source "SmartDiscovery.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;
.implements Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;


# static fields
.field private static final CLOUD_CACHE_BLOCK_DURING_FW_UPGRADE:I = 0x927c0

.field private static final KEY_IP_ADDRESS_TAG:Ljava/lang/String; = "ipAddress"

.field private static final KEY_PEERLOCAL_ADDRESS_TAG:Ljava/lang/String; = "peerLocalAddress"

.field private static final KEY_PORT_TAG:Ljava/lang/String; = "port"

.field private static final KEY_UDN_TAG:Ljava/lang/String; = "udn"

.field private static final TAG:Ljava/lang/String;

.field public static isForcedRemoteEnabled:Z


# instance fields
.field private cachedDeviceListLoaded:Z

.field private cloudCacheCalledSuccessfully:Z

.field private cloudRequestManager:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

.field private deviceCount:I

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private deviceUnicastFailedCount:I

.field private didUnicastFailForAnyDevice:Z

.field private mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private msearchFailed:Z

.field private remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 100
    const-class v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;Lcom/belkin/wemo/cache/cloud/CloudRequestManager;)V
    .locals 0
    .param p1, "devListMan"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "remoteAccessManager"    # Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
    .param p3, "mNetworkUtils"    # Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    .param p4, "cloudRequestManager"    # Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 106
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    .line 107
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 109
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->cloudRequestManager:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    .line 110
    return-void
.end method

.method private isCloudCacheAPIAllowed()Z
    .locals 10

    .prologue
    .line 140
    const/4 v2, 0x1

    .line 141
    .local v2, "isAllowed":Z
    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFWUpdateInProgressDataMap()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    const/4 v3, 0x1

    .line 142
    .local v3, "isFWUpgradeInProgress":Z
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 143
    .local v0, "currentTimeInMS":J
    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v6, v6, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getTimeStamp()J

    move-result-wide v4

    .line 145
    .local v4, "timeWhenFWUpgradeStarted":J
    sget-object v6, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CloudCache: isFWUpgradeInProgress: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; currentTimeInMS: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; timeWhenFWUpgradeStarted: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    if-eqz v3, :cond_0

    sub-long v6, v0, v4

    const-wide/32 v8, 0x927c0

    cmp-long v6, v6, v8

    if-gez v6, :cond_0

    .line 149
    const/4 v2, 0x0

    .line 152
    :cond_0
    return v2

    .line 141
    .end local v0    # "currentTimeInMS":J
    .end local v3    # "isFWUpgradeInProgress":Z
    .end local v4    # "timeWhenFWUpgradeStarted":J
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private parseResponse(Ljava/lang/String;)V
    .locals 20
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 174
    new-instance v18, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct/range {v18 .. v18}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 175
    .local v18, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v12

    .line 176
    .local v12, "doc":Lorg/w3c/dom/Document;
    const-string v2, "peerLocalAddress"

    invoke-interface {v12, v2}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v16

    .line 178
    .local v16, "nl":Lorg/w3c/dom/NodeList;
    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceCount:I

    .line 180
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget v2, v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceCount:I

    if-ge v14, v2, :cond_4

    .line 181
    move-object/from16 v0, v16

    invoke-interface {v0, v14}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v13

    check-cast v13, Lorg/w3c/dom/Element;

    .line 182
    .local v13, "e":Lorg/w3c/dom/Element;
    const-string v2, "udn"

    move-object/from16 v0, v18

    invoke-virtual {v0, v13, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 183
    .local v5, "udn":Ljava/lang/String;
    const-string v2, "port"

    move-object/from16 v0, v18

    invoke-virtual {v0, v13, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 184
    .local v4, "port":I
    const-string v2, "ipAddress"

    move-object/from16 v0, v18

    invoke-virtual {v0, v13, v2}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 185
    .local v3, "ipAddress":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 186
    .local v9, "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "http://"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, ":"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, "/setup.xml"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 188
    .local v19, "urlBase":Ljava/lang/String;
    if-eqz v9, :cond_3

    .line 189
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v8

    .line 190
    .local v8, "device":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v15

    .line 191
    .local v15, "isDiscovered":Z
    sget-object v2, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CloudCache: Device from cache.db: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; isDiscovered: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    if-eqz v8, :cond_2

    if-eqz v15, :cond_2

    .line 193
    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getRootNode()Lorg/cybergarage/xml/Node;

    move-result-object v2

    const-string v6, "URLBase"

    invoke-virtual {v2, v6}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v17

    .line 194
    .local v17, "node":Lorg/cybergarage/xml/Node;
    if-eqz v17, :cond_1

    .line 198
    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getIPAddress()Ljava/lang/String;

    move-result-object v10

    .line 199
    .local v10, "deviceIp":Ljava/lang/String;
    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getPort()I

    move-result v11

    .line 200
    .local v11, "devicePort":I
    sget-object v2, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CloudCache: deviceIP: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; devicePort: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; CloudDeviceIP: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; CloudDevicePort: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    invoke-virtual {v10, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    if-eq v11, v4, :cond_1

    .line 203
    :cond_0
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    .line 204
    new-instance v2, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {v2, v9, v6}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery;->runUnicastDiscovery(Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;)V

    .line 180
    .end local v8    # "device":Lorg/cybergarage/upnp/Device;
    .end local v10    # "deviceIp":Ljava/lang/String;
    .end local v11    # "devicePort":I
    .end local v15    # "isDiscovered":Z
    .end local v17    # "node":Lorg/cybergarage/xml/Node;
    :cond_1
    :goto_1
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_0

    .line 208
    .restart local v8    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v15    # "isDiscovered":Z
    :cond_2
    new-instance v2, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;

    new-instance v7, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;

    invoke-direct {v7}, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;-><init>()V

    move-object/from16 v6, p0

    invoke-direct/range {v2 .. v7}, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;)V

    invoke-static {v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 211
    .end local v8    # "device":Lorg/cybergarage/upnp/Device;
    .end local v15    # "isDiscovered":Z
    :cond_3
    new-instance v2, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;

    new-instance v7, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;

    invoke-direct {v7}, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;-><init>()V

    move-object/from16 v6, p0

    invoke-direct/range {v2 .. v7}, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;)V

    invoke-static {v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 214
    .end local v3    # "ipAddress":Ljava/lang/String;
    .end local v4    # "port":I
    .end local v5    # "udn":Ljava/lang/String;
    .end local v9    # "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v13    # "e":Lorg/w3c/dom/Element;
    .end local v19    # "urlBase":Ljava/lang/String;
    :cond_4
    return-void
.end method

.method private declared-synchronized requestCachedDevices()V
    .locals 5

    .prologue
    const/4 v0, 0x1

    .line 113
    monitor-enter p0

    :try_start_0
    sget-object v2, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CloudCache: NetworkMode is Local: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 115
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isCloudCacheAPIAllowed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 116
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 118
    .local v0, "isAnyDeviceAvailableForUnicast":Z
    :goto_0
    sget-object v2, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CloudCache: Did MSearch Fail: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->didMsearchFailed()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Is Any Device Available for Unicast- "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; did Unicast fail for any device: - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->didUnicastFailForAnyDevice()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Is Cached Device Loaded: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->didCachedDeviceListLoaded()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->didCachedDeviceListLoaded()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 122
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->didMsearchFailed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 124
    if-eqz v0, :cond_0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->didUnicastFailForAnyDevice()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 126
    :cond_0
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isCloudCacheCalledSuccessfully()Z

    move-result v2

    if-nez v2, :cond_1

    .line 127
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setCloudCacheCalledSuccessfully(Z)V

    .line 128
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getArpMac()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;-><init>(Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    .line 129
    .local v1, "request":Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;
    sget-object v2, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    const-string v3, "CloudCache: Calling Cloud Cache API..."

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->cloudRequestManager:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    invoke-virtual {v2, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    .end local v0    # "isAnyDeviceAvailableForUnicast":Z
    .end local v1    # "request":Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;
    :cond_1
    monitor-exit p0

    return-void

    .line 116
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 113
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method


# virtual methods
.method public declared-synchronized didCachedDeviceListLoaded()Z
    .locals 1

    .prologue
    .line 78
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->cachedDeviceListLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized didMsearchFailed()Z
    .locals 1

    .prologue
    .line 94
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->msearchFailed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized didUnicastFailForAnyDevice()Z
    .locals 1

    .prologue
    .line 86
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->didUnicastFailForAnyDevice:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDeviceUnicastFailedCount()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceUnicastFailedCount:I

    return v0
.end method

.method public isCloudCacheCalledSuccessfully()Z
    .locals 1

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->cloudCacheCalledSuccessfully:Z

    return v0
.end method

.method public isForcedRemoteEnabled()Z
    .locals 1

    .prologue
    .line 62
    sget-boolean v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled:Z

    return v0
.end method

.method public onCachedDeviceLoaded()V
    .locals 2

    .prologue
    .line 255
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setDeviceUnicastFailedCount(I)V

    .line 256
    sget-object v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    const-string v1, "CloudCache: Cached Device Loaded Successfully: "

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setCachedDeviceListLoaded(Z)V

    .line 258
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->requestCachedDevices()V

    .line 259
    return-void
.end method

.method public onDeviceDiscovered(Ljava/lang/String;ILjava/lang/String;)V
    .locals 4
    .param p1, "ipAddress"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "udn"    # Ljava/lang/String;

    .prologue
    .line 218
    sget-object v1, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CloudCache: Device Reachable via Unicast: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ";\n Feed SSDP packet to MSearch receiver/server at ControlPoint."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    invoke-static {p1, p2, p3}, Lcom/belkin/wemo/cache/utils/WemoUtils;->createSSDPPacket(Ljava/lang/String;ILjava/lang/String;)Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v0

    .line 220
    .local v0, "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lorg/cybergarage/upnp/ControlPoint;->searchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;ZZ)V

    .line 221
    return-void
.end method

.method public onDeviceNotDiscovered(Ljava/lang/String;ILjava/lang/String;)V
    .locals 4
    .param p1, "ipAddress"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "udn"    # Ljava/lang/String;

    .prologue
    .line 225
    sget-object v1, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CloudCache: Device Not Reachable via Unicast: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    iget v1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceUnicastFailedCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceUnicastFailedCount:I

    .line 228
    sget-object v1, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CloudCache: Device Not Reachable via Unicast: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " :deviceUnicastFailedCount: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceUnicastFailedCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " :deviceCount: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v0

    .line 232
    .local v0, "isRemoteEnabled":Z
    if-eqz v0, :cond_0

    .line 233
    sget-object v1, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Is Remote enabled: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    iget v1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceCount:I

    iget v2, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceUnicastFailedCount:I

    if-ne v1, v2, :cond_0

    .line 235
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->enableForcedRemote()V

    .line 238
    :cond_0
    return-void
.end method

.method public onDeviceUnicastFailed(Ljava/lang/String;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 248
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setDeviceUnicastFailedCount(I)V

    .line 249
    sget-object v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CloudCache: Device Unicast Failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setUnicastFailedForAnyDevice(Z)V

    .line 251
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->requestCachedDevices()V

    .line 252
    return-void
.end method

.method public onMSearchFailed()V
    .locals 2

    .prologue
    .line 241
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setDeviceUnicastFailedCount(I)V

    .line 242
    sget-object v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    const-string v1, "CloudCache: on MSearch Failed: "

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setMsearchFailed(Z)V

    .line 245
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->requestCachedDevices()V

    .line 246
    return-void
.end method

.method public onRequestComplete(ZI[B)V
    .locals 5
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 156
    if-eqz p1, :cond_1

    .line 158
    if-eqz p3, :cond_0

    .line 159
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, p3, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 160
    .local v1, "response":Ljava/lang/String;
    sget-object v2, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cloud Cache response: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->parseResponse(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 171
    .end local v1    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 163
    :catch_0
    move-exception v0

    .line 164
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v2, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    const-string v3, "CloudCache: UnsupportedEncodingException while encoding DeviceDiscoveryCloudCache cloud response: "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 165
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v0

    .line 166
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v2, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    const-string v3, "CloudCache: UnsupportedEncodingException for cloud cached received from cloud: "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 169
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    sget-object v2, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CloudCache: Error received while fetching devices from cloud: ; STATUS CODE: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public declared-synchronized setCachedDeviceListLoaded(Z)V
    .locals 1
    .param p1, "deviceListLoaded"    # Z

    .prologue
    .line 82
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->cachedDeviceListLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    monitor-exit p0

    return-void

    .line 82
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setCloudCacheCalledSuccessfully(Z)V
    .locals 0
    .param p1, "cloudCacheCalledSuccessfully"    # Z

    .prologue
    .line 74
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->cloudCacheCalledSuccessfully:Z

    .line 75
    return-void
.end method

.method public setDeviceUnicastFailedCount(I)V
    .locals 0
    .param p1, "deviceUnicastFailedCount"    # I

    .prologue
    .line 54
    iput p1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->deviceUnicastFailedCount:I

    .line 55
    return-void
.end method

.method public setForcedRemoteEnabled(Z)V
    .locals 0
    .param p1, "isForcedRemoteEnabled"    # Z

    .prologue
    .line 66
    sput-boolean p1, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled:Z

    .line 67
    return-void
.end method

.method public declared-synchronized setMsearchFailed(Z)V
    .locals 1
    .param p1, "msearchFailed"    # Z

    .prologue
    .line 98
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->msearchFailed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    monitor-exit p0

    return-void

    .line 98
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUnicastFailedForAnyDevice(Z)V
    .locals 1
    .param p1, "unicastFailed"    # Z

    .prologue
    .line 90
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->didUnicastFailForAnyDevice:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    monitor-exit p0

    return-void

    .line 90
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
