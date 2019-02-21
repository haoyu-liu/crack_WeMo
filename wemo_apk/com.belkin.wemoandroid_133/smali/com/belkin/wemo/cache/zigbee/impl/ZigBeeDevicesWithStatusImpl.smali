.class public Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;
.super Ljava/lang/Object;
.source "ZigBeeDevicesWithStatusImpl.java"

# interfaces
.implements Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private bridgeUDN:Ljava/lang/String;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0
    .param p1, "bridgeUdn"    # Ljava/lang/String;
    .param p2, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p2, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 35
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->bridgeUDN:Ljava/lang/String;

    .line 36
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    return-object v0
.end method


# virtual methods
.method public fetchZigBeeDevices(Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;)V
    .locals 8
    .param p1, "callback"    # Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->bridgeUDN:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v0, :cond_1

    .line 42
    :cond_0
    if-eqz p1, :cond_1

    .line 43
    new-instance v0, Lcom/belkin/wemo/error/WeMoError;

    const/16 v2, 0x1f5

    const-string v3, "ZigBee Devices could not be fetched."

    invoke-direct {v0, v2, v3}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    invoke-interface {p1, v0}, Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;->onZigBeeDevicesFetchError(Lcom/belkin/wemo/error/WeMoError;)V

    .line 47
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    .line 48
    .local v7, "dev":Lorg/cybergarage/upnp/Device;
    if-eqz v7, :cond_2

    .line 49
    sget-object v0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Discovery Zigbee: Control Point Device for Bridge. IP: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getIPAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    const-string v0, "GetEndDevicesWithStatus"

    invoke-virtual {v7, v0}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 52
    .local v1, "fetchZigBeeDevicesAction":Lorg/cybergarage/upnp/Action;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 53
    .local v6, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_END_DEVICES_WITH_STATUS_ARGS:Ljava/lang/String;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v6, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    new-instance v4, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;

    invoke-virtual {v7}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, p0, v0, p1}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;-><init>(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;Ljava/lang/String;Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;)V

    .line 56
    .local v4, "actionCallback":Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v5, v4

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;Ljava/util/Map;)V

    .line 63
    .end local v1    # "fetchZigBeeDevicesAction":Lorg/cybergarage/upnp/Action;
    .end local v4    # "actionCallback":Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;
    .end local v6    # "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    return-void
.end method
