.class Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;
.super Ljava/lang/Object;
.source "UpnpDeviceList.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->setLedDeviceStatus(Lorg/json/JSONArray;Lorg/json/JSONArray;)Lorg/json/JSONArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# direct methods
.method constructor <init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)V
    .locals 0

    .prologue
    .line 1802
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 1804
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-static {v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$000(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 1805
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 1806
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Bridge"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1807
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$102(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Ljava/lang/String;)Ljava/lang/String;

    .line 1805
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1810
    :cond_1
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-static {v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$100(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    if-eqz v1, :cond_2

    .line 1811
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-static {v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$100(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 1812
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-static {v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$100(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    const-string v4, "SetDeviceStatus"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1813
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->SET_LED_DEVICE_STATUS_SINGLE:[Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    iget-object v8, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-static {v8}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$200(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-static {v9}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$300(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-static {v10}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$400(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-static {v11}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$500(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->domXml(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v0, v4, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$600(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)Z

    .line 1814
    iget-object v3, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$702(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;Ljava/lang/String;)Ljava/lang/String;

    .line 1815
    const-string v3, "UpnpDeviceList"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "set led devices status ===+"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-static {v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->access$700(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1818
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :cond_2
    return-void
.end method
