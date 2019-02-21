.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FetchZigBeeDevicesCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private udn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V
    .locals 0
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    .line 2267
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2268
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;->udn:Ljava/lang/String;

    .line 2269
    return-void
.end method


# virtual methods
.method public onZigBeeDevicesFetchError(Lcom/belkin/wemo/error/WeMoError;)V
    .locals 3
    .param p1, "wemoError"    # Lcom/belkin/wemo/error/WeMoError;

    .prologue
    .line 2300
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discovery Zigbee: Exception while fetching ZigBee Devices: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/error/WeMoError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2301
    return-void
.end method

.method public onZigBeeDevicesFetched(Ljava/util/Map;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2274
    .local p1, "zigBeeDevicesMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz p1, :cond_1

    .line 2275
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery Zigbee: ON Zigbee Devices Fetched. Count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2276
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v4, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$700(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/util/Map;)V

    .line 2277
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery Zigbee: ON Zigbee Devices Fetched. Count after removing offline groups: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2279
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 2281
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2282
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$400()Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v4

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    const-string v6, "icon"

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceStringProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 2284
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;->udn:Ljava/lang/String;

    const-string v6, "Discovery Success"

    invoke-static {v4, v5, v0, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$800(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)V

    goto :goto_0

    .line 2287
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "key":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getLEDDeviceIconInfo()V

    .line 2288
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "zigbee_status_done"

    const-string v6, ""

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;->udn:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2292
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2293
    new-instance v3, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 2294
    .local v3, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v4, "cache.db"

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v3, v4, v5}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 2296
    .end local v3    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_2
    return-void
.end method
