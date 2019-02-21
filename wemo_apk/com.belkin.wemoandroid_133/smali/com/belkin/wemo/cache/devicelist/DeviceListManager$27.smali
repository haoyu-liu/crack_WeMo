.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateDeviceParameters(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field final synthetic val$dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field final synthetic val$deviceObj:Lorg/cybergarage/upnp/Device;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/cybergarage/upnp/Device;)V
    .locals 0

    .prologue
    .line 7290
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->val$dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->val$deviceObj:Lorg/cybergarage/upnp/Device;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 7294
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->val$dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->val$deviceObj:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDevice(Lorg/cybergarage/upnp/Device;)V

    .line 7295
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->access$300(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->val$dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 7296
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " updating device parameters completed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->val$dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7297
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v1, "update"

    const-string v2, ""

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->val$dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 7298
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->val$dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/IsDevice;->Bridge(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 7299
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;->val$dev:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initiateScanZigBeeDevice(Ljava/lang/String;)V

    .line 7301
    :cond_0
    return-void
.end method
