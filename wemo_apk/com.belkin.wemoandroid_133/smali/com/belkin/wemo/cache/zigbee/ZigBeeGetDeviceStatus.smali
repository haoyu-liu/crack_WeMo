.class public Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus;
.super Ljava/lang/Object;
.source "ZigBeeGetDeviceStatus.java"


# instance fields
.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0
    .param p1, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 17
    return-void
.end method

.method private setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 4
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "keyList"    # [Ljava/lang/String;
    .param p3, "argList"    # [Ljava/lang/String;

    .prologue
    .line 54
    const-string v1, "ZigbeeScan"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "keyList size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    .line 56
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 57
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    invoke-virtual {p1, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 60
    .end local v0    # "counter":I
    :cond_0
    const/4 v1, 0x0

    .line 62
    :goto_1
    return v1

    .restart local v0    # "counter":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public getZigBeeDevicesFromBridge(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .param p1, "bridgeUDN"    # Ljava/lang/String;
    .param p2, "devids"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 21
    const-string v6, "ZigbeeScan"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "in getZigBeeDevicesFromBridge:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    const-string v5, ""

    .line 23
    .local v5, "getStatusResponse":Ljava/lang/String;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .local v4, "getLeddevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;>;"
    :try_start_0
    iget-object v6, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v6, :cond_0

    .line 26
    iget-object v6, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v6

    invoke-virtual {v6, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 27
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_0

    .line 28
    const-string v6, "GetDeviceStatus"

    invoke-virtual {v1, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 29
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVICEIDS:[Ljava/lang/String;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object p2, v7, v8

    invoke-direct {p0, v0, v6, v7}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceStatus;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 30
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v5

    .line 31
    const-string v6, "ZigbeeScan"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "action response"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    if-eqz v5, :cond_0

    .line 33
    new-instance v3, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;-><init>()V

    .line 34
    .local v3, "getDevicesStatusResp":Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;
    invoke-virtual {v3, v5}, Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;->parseForDeviceListStatus(Ljava/lang/String;)Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 43
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    .end local v3    # "getDevicesStatusResp":Lcom/belkin/wemo/cache/zigbee/GetDeviceListStatusResponse;
    :cond_0
    :goto_0
    return-object v4

    .line 40
    :catch_0
    move-exception v2

    .line 41
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
