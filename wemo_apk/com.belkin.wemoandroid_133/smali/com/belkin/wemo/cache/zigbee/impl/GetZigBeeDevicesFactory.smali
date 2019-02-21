.class public Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;
.super Ljava/lang/Object;
.source "GetZigBeeDevicesFactory.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "ZigBeeDeviceFactory"

.field private static zigBeeDevicesInstance:Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method public static declared-synchronized destroy()V
    .locals 2

    .prologue
    .line 37
    const-class v1, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->zigBeeDevicesInstance:Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    if-eqz v0, :cond_0

    .line 38
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->zigBeeDevicesInstance:Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    :cond_0
    monitor-exit v1

    return-void

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getZigBeeDeviceWithStatusInstanceAPISupport(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;
    .locals 1
    .param p1, "bridgeUdn"    # Ljava/lang/String;
    .param p2, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 43
    sget-object v0, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->zigBeeDevicesInstance:Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;

    invoke-direct {v0, p1, p2}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;-><init>(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    sput-object v0, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->zigBeeDevicesInstance:Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    .line 46
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->zigBeeDevicesInstance:Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    return-object v0
.end method

.method private getZigBeeDeviceWithoutStatusInstanceAPISupport(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;
    .locals 1
    .param p1, "bridgeUdn"    # Ljava/lang/String;
    .param p2, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 49
    sget-object v0, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->zigBeeDevicesInstance:Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    if-nez v0, :cond_0

    .line 50
    new-instance v0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;

    invoke-direct {v0, p1, p2}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;-><init>(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    sput-object v0, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->zigBeeDevicesInstance:Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    .line 52
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->zigBeeDevicesInstance:Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    return-object v0
.end method


# virtual methods
.method public getGetZigBeeDevicesInstance(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;
    .locals 3
    .param p1, "bridgeUdn"    # Ljava/lang/String;
    .param p2, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 21
    const-string v1, "ZigBeeDeviceFactory"

    const-string v2, "Unification: in getGetZigBeeDevicesInstance"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    const/4 v0, 0x0

    .line 24
    .local v0, "zigBeeDeviceIns":Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;
    if-eqz p1, :cond_0

    .line 25
    invoke-static {p1, p2}, Lcom/belkin/wemo/cache/utils/WemoUtils;->isGetEndDevicesWithStatusSupported(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 26
    const-string v1, "ZigBeeDeviceFactory"

    const-string v2, "Unification: in getGetZigBeeDevicesInstance"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->getZigBeeDeviceWithStatusInstanceAPISupport(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    move-result-object v0

    .line 33
    :cond_0
    :goto_0
    return-object v0

    .line 29
    :cond_1
    const-string v1, "ZigBeeDeviceFactory"

    const-string v2, "Unification: in getGetZigBeeDevicesInstance"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->getZigBeeDeviceWithoutStatusInstanceAPISupport(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    move-result-object v0

    goto :goto_0
.end method
