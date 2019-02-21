.class Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;
.super Ljava/lang/Object;
.source "UpnpDeviceSetup.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->setLedDeviceStatus(Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;


# direct methods
.method constructor <init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)V
    .locals 0

    .prologue
    .line 609
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 611
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    invoke-static {v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->access$000(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 612
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 613
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    invoke-virtual {v3, v11}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    .line 614
    .local v2, "udn":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    const-string v4, "SetDeviceStatus"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 615
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_LED_DEVICE_STATUS_SINGLE:[Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    iget-object v7, v7, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->onORoff:Ljava/lang/String;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    iget-object v8, v8, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->deviceId:Ljava/lang/String;

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    iget-object v9, v9, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->capabilityID:Ljava/lang/String;

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    iget-object v10, v10, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->isGroupAction:Ljava/lang/String;

    invoke-virtual {v6, v7, v8, v9, v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->domXml(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v11

    invoke-static {v3, v0, v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->access$100(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 616
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mResponseString:Ljava/lang/String;

    .line 617
    const-string v3, "UpnpDeviceSetup"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "set led devices status ===+"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$2;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    iget-object v5, v5, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->mResponseString:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v2    # "udn":Ljava/lang/String;
    :cond_0
    return-void
.end method
