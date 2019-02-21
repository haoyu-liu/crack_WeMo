.class Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;
.super Ljava/lang/Object;
.source "ZigBeeDevicesWithStatusImpl.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PostActionCallback"
.end annotation


# instance fields
.field private callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

.field final synthetic this$0:Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;Ljava/lang/String;Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;)V
    .locals 0
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->this$0:Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p2, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->udn:Ljava/lang/String;

    .line 72
    iput-object p3, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    .line 73
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 114
    invoke-static {}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Discovery Zigbee: Exception while fetching ZigBee Devices: "

    invoke-static {v0, v1, p1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 115
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    new-instance v1, Lcom/belkin/wemo/error/WeMoError;

    const/16 v2, 0x1f5

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;->onZigBeeDevicesFetchError(Lcom/belkin/wemo/error/WeMoError;)V

    .line 118
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 10
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 77
    invoke-static {}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery Zigbee: in getZigBeeDevices response: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    const/4 v3, 0x0

    .line 79
    .local v3, "zigBeeDeviceMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v4, "app_error"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 80
    new-instance v0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;-><init>()V

    .line 81
    .local v0, "getEndDevicesListResp":Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;
    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->this$0:Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;

    invoke-static {v4}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->access$100(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->udn:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v4

    invoke-virtual {v0, p1, v4}, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->parseGetEndDeviceListWithStatus(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/util/HashMap;

    move-result-object v3

    .line 83
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 84
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDeviceIdAvailablity()Ljava/lang/String;

    move-result-object v4

    const-string v5, "YES"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 85
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilityID()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilityvalue()Ljava/lang/String;

    move-result-object v5

    const-string v7, "10006"

    invoke-static {v6, v5, v7}, Lcom/belkin/wemo/cache/zigbee/ZigBeeCapabilities;->getCapabilitiesValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 90
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 91
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 92
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilityID()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilityvalue()Ljava/lang/String;

    move-result-object v5

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-static {v6, v5, v7}, Lcom/belkin/wemo/cache/zigbee/ZigBeeCapabilities;->capabilitiesToJSON(Ljava/lang/String;Ljava/lang/String;Ljava/util/LinkedHashMap;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V

    .line 93
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->udn:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBridgeUDN(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 95
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl;->access$000()Ljava/lang/String;

    move-result-object v5

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery Zigbee: device is not available & not added to devicelist:"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 97
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 98
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->incrementOfflineLEDCount()V

    goto/16 :goto_0

    .line 101
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    if-eqz v4, :cond_3

    .line 102
    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    invoke-interface {v4, v3}, Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;->onZigBeeDevicesFetched(Ljava/util/Map;)V

    .line 110
    .end local v0    # "getEndDevicesListResp":Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    return-void

    .line 105
    .restart local v0    # "getEndDevicesListResp":Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_3
    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    if-eqz v4, :cond_2

    .line 106
    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    new-instance v5, Lcom/belkin/wemo/error/WeMoError;

    const/16 v6, 0x1f5

    const-string v7, "ZigBee Devices could not be fetched."

    invoke-direct {v5, v6, v7}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    invoke-interface {v4, v5}, Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;->onZigBeeDevicesFetchError(Lcom/belkin/wemo/error/WeMoError;)V

    goto :goto_1
.end method
