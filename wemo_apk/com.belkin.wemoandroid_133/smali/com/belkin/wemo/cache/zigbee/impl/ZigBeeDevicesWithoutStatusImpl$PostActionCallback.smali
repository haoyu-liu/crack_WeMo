.class Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;
.super Ljava/lang/Object;
.source "ZigBeeDevicesWithoutStatusImpl.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PostActionCallback"
.end annotation


# instance fields
.field private callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

.field final synthetic this$0:Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;Ljava/lang/String;Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;)V
    .locals 0
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "callback"    # Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->this$0:Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    iput-object p2, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->udn:Ljava/lang/String;

    .line 119
    iput-object p3, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    .line 120
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 158
    sget-object v0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->TAG:Ljava/lang/String;

    const-string v1, "Discovery Zigbee: Exception while fetching ZigBee Devices: "

    invoke-static {v0, v1, p1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 159
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    new-instance v1, Lcom/belkin/wemo/error/WeMoError;

    const/16 v2, 0x1f5

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;->onZigBeeDevicesFetchError(Lcom/belkin/wemo/error/WeMoError;)V

    .line 162
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 10
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    .line 124
    const/4 v5, 0x0

    .line 125
    .local v5, "zigBeeDeviceMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_3

    const-string v6, "app_error"

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 126
    sget-object v6, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Discovery Zigbee: in getZigBeeDevices response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    new-instance v1, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;

    invoke-direct {v1}, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;-><init>()V

    .line 129
    .local v1, "getEndDevicesListResp":Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;
    iget-object v6, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->this$0:Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;

    invoke-static {v6}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->access$000(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->udn:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v6

    invoke-virtual {v1, p1, v6}, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->parseGetEndDeviceList(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/util/HashMap;

    move-result-object v5

    .line 130
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, ""

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .local v4, "keys":Ljava/lang/StringBuilder;
    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 132
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 133
    goto :goto_0

    .line 134
    .end local v3    # "key":Ljava/lang/String;
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_1

    .line 135
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 136
    sget-object v6, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Discovery Zigbee: ZB Device Count after GetEndDevice call: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    iget-object v6, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->this$0:Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;

    iget-object v7, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->udn:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8, v5}, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->access$100(Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 139
    :cond_1
    iget-object v6, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    if-eqz v6, :cond_4

    .line 140
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 141
    sget-object v6, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Discovery Zigbee: Final Status of ALL Zigbee Devices. Count: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 143
    .local v0, "ZBDeviceEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    sget-object v7, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Discovery Zigbee: Zigbee Device Final Status: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 146
    .end local v0    # "ZBDeviceEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_2
    iget-object v6, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    invoke-interface {v6, v5}, Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;->onZigBeeDevicesFetched(Ljava/util/Map;)V

    .line 154
    .end local v1    # "getEndDevicesListResp":Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "keys":Ljava/lang/StringBuilder;
    :cond_3
    :goto_2
    return-void

    .line 149
    .restart local v1    # "getEndDevicesListResp":Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "keys":Ljava/lang/StringBuilder;
    :cond_4
    iget-object v6, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    if-eqz v6, :cond_3

    .line 150
    iget-object v6, p0, Lcom/belkin/wemo/cache/zigbee/impl/ZigBeeDevicesWithoutStatusImpl$PostActionCallback;->callback:Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;

    new-instance v7, Lcom/belkin/wemo/error/WeMoError;

    const/16 v8, 0x1f5

    const-string v9, "ZigBee Devices could not be fetched."

    invoke-direct {v7, v8, v9}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    invoke-interface {v6, v7}, Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;->onZigBeeDevicesFetchError(Lcom/belkin/wemo/error/WeMoError;)V

    goto :goto_2
.end method
