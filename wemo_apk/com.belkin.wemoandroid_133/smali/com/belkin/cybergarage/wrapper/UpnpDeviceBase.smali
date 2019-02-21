.class public Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;
.super Ljava/lang/Object;
.source "UpnpDeviceBase.java"


# static fields
.field public static final MSEARCH_INTERVAL:I = 0x1f4

.field public static final MSEARCH_ITERATION:I = 0x2

.field private static final TAG:Ljava/lang/String; = "UpnpSetupBase"


# instance fields
.field private context:Landroid/content/Context;

.field protected mDevice:Lorg/cybergarage/upnp/Device;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 72
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->context:Landroid/content/Context;

    .line 73
    return-void
.end method


# virtual methods
.method public UpnpInitialization()Z
    .locals 2

    .prologue
    .line 80
    const-string v0, "UpnpSetupBase"

    const-string v1, "UpnpInitialization():"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    invoke-virtual {p0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 99
    const-string v0, "UpnpSetupBase"

    const-string v1, " getDeviceList() != null :: returing TRUE"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    const/4 v0, 0x1

    .line 102
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public destroyControlPointNow()V
    .locals 3

    .prologue
    .line 142
    const-string v1, "UpnpSetupBase"

    const-string v2, "destroyControlPointNow()"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 144
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->finalizeCP()V

    .line 145
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->stop()Z

    .line 146
    const/4 v0, 0x0

    .line 147
    return-void
.end method

.method public eventNotifyReceived(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "uuid"    # Ljava/lang/String;
    .param p2, "seq"    # J
    .param p4, "varName"    # Ljava/lang/String;
    .param p5, "value"    # Ljava/lang/String;

    .prologue
    .line 153
    return-void
.end method

.method protected getDeviceList()Lorg/cybergarage/upnp/DeviceList;
    .locals 6

    .prologue
    .line 111
    iget-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 112
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v1

    .line 113
    .local v1, "deviceList":Lorg/cybergarage/upnp/DeviceList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/16 v4, 0xa

    if-ge v3, v4, :cond_1

    .line 115
    const-wide/16 v4, 0x5dc

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 116
    invoke-virtual {v1}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 117
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    iput-object v4, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 125
    .end local v1    # "deviceList":Lorg/cybergarage/upnp/DeviceList;
    :goto_1
    return-object v1

    .line 120
    .restart local v1    # "deviceList":Lorg/cybergarage/upnp/DeviceList;
    :cond_0
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 113
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 121
    :catch_0
    move-exception v2

    .line 122
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2

    .line 125
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getSetupDevice()Lorg/cybergarage/upnp/Device;
    .locals 2

    .prologue
    .line 130
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v0

    .line 131
    .local v0, "deviceList":Lorg/cybergarage/upnp/DeviceList;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 133
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 134
    iget-object v1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceBase;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 136
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
