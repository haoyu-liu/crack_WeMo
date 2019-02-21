.class public Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;
.super Ljava/lang/Object;
.source "ZigBeeDevice.java"


# instance fields
.field private capabilityID:Ljava/lang/String;

.field private currentState:Ljava/lang/String;

.field private deviceFriendlyName:Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private deviceIdAvailablity:Ljava/lang/String;

.field private deviceIndex:Ljava/lang/String;

.field private deviceListType:Ljava/lang/String;

.field private discoveryState:Ljava/lang/String;

.field private firmwareVersion:Ljava/lang/String;

.field private groupCapabilities:Ljava/lang/String;

.field private groupCapabilityID:Ljava/lang/String;

.field private groupID:Ljava/lang/String;

.field private groupName:Ljava/lang/String;

.field private iconVersion:Ljava/lang/String;

.field public mGrpLEDs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;",
            ">;"
        }
    .end annotation
.end field

.field private manufacturerName:Ljava/lang/String;

.field private modelCode:Ljava/lang/String;

.field private wemoCertified:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->discoveryState:Ljava/lang/String;

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->mGrpLEDs:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public addLEDInGrp(Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;)V
    .locals 1
    .param p1, "ledDevice"    # Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->mGrpLEDs:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->mGrpLEDs:Ljava/util/ArrayList;

    .line 167
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->mGrpLEDs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 168
    return-void
.end method

.method public getCapabilityID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->capabilityID:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->currentState:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceFriendlyName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceFriendlyName:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceIdAvailablity()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceIdAvailablity:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceIndex()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceIndex:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceListType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceListType:Ljava/lang/String;

    return-object v0
.end method

.method public getDiscoveryState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->discoveryState:Ljava/lang/String;

    return-object v0
.end method

.method public getFirmwareVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->firmwareVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupCapabilities()Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->groupCapabilities:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupCapabilityID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->groupCapabilityID:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->groupID:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->groupName:Ljava/lang/String;

    return-object v0
.end method

.method public getIconVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->iconVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getLedGrpDevices()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->mGrpLEDs:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getManufacturerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->manufacturerName:Ljava/lang/String;

    return-object v0
.end method

.method public getModelCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->modelCode:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 74
    const-string v0, ""

    .line 76
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->modelCode:Ljava/lang/String;

    goto :goto_0
.end method

.method public getWemoCertified()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->wemoCertified:Ljava/lang/String;

    return-object v0
.end method

.method public isGroupLed()Z
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->mGrpLEDs:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->mGrpLEDs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 172
    const/4 v0, 0x1

    .line 174
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCapabilityID(Ljava/lang/String;)V
    .locals 0
    .param p1, "capabilityID"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->capabilityID:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public setCurrentState(Ljava/lang/String;)V
    .locals 0
    .param p1, "currentState"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->currentState:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setDeviceFriendlyName(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceFriendlyName"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceFriendlyName:Ljava/lang/String;

    .line 89
    return-void
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceId:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setDeviceIdAvailablity(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceIdAvailablity"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceIdAvailablity:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public setDeviceIndex(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceIndex"    # Ljava/lang/String;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceIndex:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public setDeviceListType(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceListType"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->deviceListType:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setDiscoveryState(Ljava/lang/String;)V
    .locals 0
    .param p1, "discoveryState"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->discoveryState:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public setFirmwareVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "firmwareVersion"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->firmwareVersion:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public setGroupCapabilities(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupCapabilities"    # Ljava/lang/String;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->groupCapabilities:Ljava/lang/String;

    .line 153
    return-void
.end method

.method public setGroupCapabilityID(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupCapabilityID"    # Ljava/lang/String;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->groupCapabilityID:Ljava/lang/String;

    .line 145
    return-void
.end method

.method public setGroupID(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupID"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->groupID:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public setGroupName(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupName"    # Ljava/lang/String;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->groupName:Ljava/lang/String;

    .line 137
    return-void
.end method

.method public setIconVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "iconVersion"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->iconVersion:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public setManufacturerName(Ljava/lang/String;)V
    .locals 0
    .param p1, "manufacturerName"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->manufacturerName:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setModelCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "modelCode"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->modelCode:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public setWemoCertified(Ljava/lang/String;)V
    .locals 0
    .param p1, "wemoCertified"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;->wemoCertified:Ljava/lang/String;

    .line 54
    return-void
.end method
