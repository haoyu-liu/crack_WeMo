.class public Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;
.super Ljava/lang/Object;
.source "ZigBeeGetDeviceListStatusResponse.java"


# static fields
.field private static final NO:Ljava/lang/String; = "NO"


# instance fields
.field private Avability:Ljava/lang/String;

.field private DeviceIDLED:Ljava/lang/String;

.field private capabilityid:Ljava/lang/String;

.field private capabilityvalue:Ljava/lang/String;

.field private isGroupAction:Ljava/lang/String;

.field private lastEventTimeStamp:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->lastEventTimeStamp:I

    return-void
.end method


# virtual methods
.method public getAvability()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->Avability:Ljava/lang/String;

    return-object v0
.end method

.method public getCapabilityid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->capabilityid:Ljava/lang/String;

    return-object v0
.end method

.method public getCapabilityvalue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->capabilityvalue:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceIDLED()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->DeviceIDLED:Ljava/lang/String;

    return-object v0
.end method

.method public getIsGroupAction()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->isGroupAction:Ljava/lang/String;

    return-object v0
.end method

.method public getLastEventTimeStamp()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->lastEventTimeStamp:I

    return v0
.end method

.method public isAvailable()Z
    .locals 2

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->getAvability()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NO"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    const/4 v0, 0x0

    .line 56
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setAvability(Ljava/lang/String;)V
    .locals 0
    .param p1, "avability"    # Ljava/lang/String;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->Avability:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public setCapabilityid(Ljava/lang/String;)V
    .locals 0
    .param p1, "capabilityid"    # Ljava/lang/String;

    .prologue
    .line 17
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->capabilityid:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public setCapabilityvalue(Ljava/lang/String;)V
    .locals 0
    .param p1, "capabilityvalue"    # Ljava/lang/String;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->capabilityvalue:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public setDeviceIDLED(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceIDLED"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->DeviceIDLED:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public setIsGroupAction(Ljava/lang/String;)V
    .locals 0
    .param p1, "isGroupAction"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->isGroupAction:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public setLastEventTimeStamp(I)V
    .locals 0
    .param p1, "lastEventTimeStamp"    # I

    .prologue
    .line 65
    iput p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeGetDeviceListStatusResponse;->lastEventTimeStamp:I

    .line 66
    return-void
.end method
