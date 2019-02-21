.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->deviceAdded(Lorg/cybergarage/upnp/Device;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$device:Lorg/cybergarage/upnp/Device;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lorg/cybergarage/upnp/Device;)V
    .locals 0

    .prologue
    .line 2080
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;->val$device:Lorg/cybergarage/upnp/Device;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMSearchProcessingDone(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 5
    .param p1, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 2083
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    .line 2084
    .local v1, "udn":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$500(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2085
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Discovery: MSearch Device processing completed. Removed from list. UDN: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;->val$device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". MSearch processing in progress count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$500(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2087
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFwStatus()Ljava/lang/String;

    move-result-object v0

    .line 2088
    .local v0, "fwStatus":Ljava/lang/String;
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FW Update: Discovery: MSearch Device FW Status: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; UDN: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2118
    return-void
.end method

.method public onMSearchProcessingFailed(Ljava/lang/String;)V
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 2123
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$500(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2124
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discovery: MSearch Device processing FAILED. Removed from list. UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;->val$device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". MSearch processing in progress count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$500(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2125
    return-void
.end method
