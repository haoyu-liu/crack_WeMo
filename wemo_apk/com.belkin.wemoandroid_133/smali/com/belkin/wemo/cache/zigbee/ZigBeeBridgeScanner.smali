.class public Lcom/belkin/wemo/cache/zigbee/ZigBeeBridgeScanner;
.super Ljava/lang/Object;
.source "ZigBeeBridgeScanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/zigbee/ZigBeeBridgeScanner$getEndList;
    }
.end annotation


# instance fields
.field controlPoint:Lorg/cybergarage/upnp/ControlPoint;


# direct methods
.method public constructor <init>(Lorg/cybergarage/upnp/ControlPoint;)V
    .locals 0
    .param p1, "controlPoint"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeBridgeScanner;->controlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 20
    return-void
.end method

.method private setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 3
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "keyList"    # [Ljava/lang/String;
    .param p3, "argList"    # [Ljava/lang/String;

    .prologue
    .line 103
    if-eqz p3, :cond_0

    if-eqz p2, :cond_0

    .line 104
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 105
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    invoke-virtual {p1, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 108
    .end local v0    # "counter":I
    :cond_0
    const/4 v1, 0x0

    .line 110
    :goto_1
    return v1

    .restart local v0    # "counter":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public getZigBeeDevicesFromBridge(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .param p1, "bridgeUDN"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 23
    const-string v5, "ZigbeeScan"

    const-string v6, "in getZigBeeDevicesFromBridge"

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    :try_start_0
    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeBridgeScanner;->controlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v5, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 26
    .local v1, "dev":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_0

    .line 27
    const-string v5, "GetEndDevices"

    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 28
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->GET_END_DEVICES_ARGS:[Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x1

    sget-object v8, Lcom/belkin/wemo/cache/zigbee/ZigBeeBridgeScanner$getEndList;->PAIRED_LIST:Lcom/belkin/wemo/cache/zigbee/ZigBeeBridgeScanner$getEndList;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-direct {p0, v0, v5, v6}, Lcom/belkin/wemo/cache/zigbee/ZigBeeBridgeScanner;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 29
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 30
    .local v4, "mResponseString":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 31
    const-string v5, "ZigbeeScan"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "responseString:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    new-instance v3, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;-><init>()V

    .line 33
    .local v3, "getEndDevicesListResp":Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;
    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->parseForGetEndDeviceList(Ljava/lang/String;)Ljava/util/ArrayList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 39
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v3    # "getEndDevicesListResp":Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;
    .end local v4    # "mResponseString":Ljava/lang/String;
    :goto_0
    return-object v5

    .line 36
    :catch_0
    move-exception v2

    .line 37
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 39
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method
