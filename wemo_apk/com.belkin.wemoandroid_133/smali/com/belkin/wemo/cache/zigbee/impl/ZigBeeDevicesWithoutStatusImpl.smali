.class public Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;
.super Ljava/lang/Object;
.source "ZigBeeDevicesWithoutStatusImpl.java"

# interfaces
.implements Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;,
        Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$getEndList;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private bridgeUDN:Ljava/lang/String;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0
    .param p1, "bridgeUdn"    # Ljava/lang/String;
    .param p2, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p2, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 38
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->bridgeUDN:Ljava/lang/String;

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/util/Map;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->getLEDDeviceStatus(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private getLEDDeviceStatus(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 10
    .param p1, "bridgeDevice"    # Ljava/lang/String;
    .param p2, "ledDeviceIDs"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "ledDeviceList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 74
    new-instance v2, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus;

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {v2, v5}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    .line 75
    .local v2, "zbGetStatus":Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus;
    invoke-virtual {v2, p1, p2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus;->getZigBeeDevicesFromBridge(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 78
    .local v4, "zbRespArr":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_2

    .line 79
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;

    .line 80
    .local v3, "zbResp":Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;
    if-eqz v3, :cond_0

    .line 81
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->getDeviceIDLED()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 82
    .local v1, "zbDevInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v5, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Discovery Zigbee: zbResp.getDeviceIDLED(): "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->getDeviceIDLED()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    if-eqz v1, :cond_0

    .line 84
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->getLastEventTimeStamp()I

    move-result v5

    invoke-virtual {v1, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStatusTS(I)V

    .line 85
    sget-object v5, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " Discovery Zigbee: LED ID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; isAvailable: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->isAvailable()Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->getCapabilityid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->getCapabilityvalue()Ljava/lang/String;

    move-result-object v6

    const-string v7, "10006"

    invoke-static {v5, v6, v7}, Lcom/belkin/wemo/cache/zigbee/ZigBeeCapabilities;->getCapabilitiesValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v1, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 93
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->getCapabilityid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->getCapabilityvalue()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-static {v5, v6, v7}, Lcom/belkin/wemo/cache/zigbee/ZigBeeCapabilities;->capabilitiesToJSON(Ljava/lang/String;Ljava/lang/String;Ljava/util/LinkedHashMap;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V

    .line 94
    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBridgeUDN(Ljava/lang/String;)V

    .line 96
    invoke-virtual {v3}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->isAvailable()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 97
    invoke-virtual {v1, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 98
    invoke-virtual {v1, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    goto/16 :goto_0

    .line 101
    :cond_1
    const-string v5, "ZigbeeScan"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " Discovery Zigbee: device is not available & not added to devicelist:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    invoke-virtual {v1, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 103
    invoke-virtual {v1, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 104
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->incrementOfflineLEDCount()V

    goto/16 :goto_0

    .line 110
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "zbDevInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "zbResp":Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;
    :cond_2
    return-void
.end method


# virtual methods
.method public fetchZigBeeDevices(Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;)V
    .locals 8
    .param p1, "callback"    # Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->bridgeUDN:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v0, :cond_1

    .line 45
    :cond_0
    if-eqz p1, :cond_1

    .line 46
    new-instance v0, Lcom/belkin/wemo/error/WeMoError;

    const/16 v2, 0x1f5

    const-string v3, "ZigBee Devices could not be fetched."

    invoke-direct {v0, v2, v3}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    invoke-interface {p1, v0}, Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;->onZigBeeDevicesFetchError(Lcom/belkin/wemo/error/WeMoError;)V

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    .line 50
    .local v7, "dev":Lorg/cybergarage/upnp/Device;
    if-eqz v7, :cond_2

    .line 52
    const-string v0, "GetEndDevices"

    invoke-virtual {v7, v0}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 54
    .local v1, "fetchZigBeeDevicesAction":Lorg/cybergarage/upnp/Action;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 56
    .local v6, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_END_DEVICES_ARGS:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v0, v0, v2

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v6, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_END_DEVICES_ARGS:[Ljava/lang/String;

    const/4 v2, 0x1

    aget-object v0, v0, v2

    sget-object v2, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$getEndList;->PAIRED_LIST:Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$getEndList;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    new-instance v4, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, p0, v0, p1}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;-><init>(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;Ljava/lang/String;Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;)V

    .line 60
    .local v4, "actionCallback":Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v5, v4

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;Ljava/util/Map;)V

    .line 67
    .end local v1    # "fetchZigBeeDevicesAction":Lorg/cybergarage/upnp/Action;
    .end local v4    # "actionCallback":Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;
    .end local v6    # "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    return-void
.end method
