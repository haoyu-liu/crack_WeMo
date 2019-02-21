.class public Lcom/belkin/wemo/cache/data/DeviceInformation;
.super Ljava/lang/Object;
.source "DeviceInformation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/data/DeviceInformation$1;,
        Lcom/belkin/wemo/cache/data/DeviceInformation$GetIconURLActionCallback;,
        Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;
    }
.end annotation


# instance fields
.field private ID:I

.field private IP:Ljava/lang/String;

.field private LEDCapabilities:Ljava/lang/String;

.field private LEDGroupID:I

.field private LEDGroupName:Ljava/lang/String;

.field private LEDUniqueID:Ljava/lang/String;

.field private LEDbridgeUDN:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field private UDN:Ljava/lang/String;

.field private attrList:Lorg/json/JSONObject;

.field private availablity:Z

.field private binaryState:Ljava/lang/String;

.field private brandName:Ljava/lang/String;

.field private bridgeUDN:Ljava/lang/String;

.field private capabilities:Ljava/lang/String;

.field private capabilityID:Ljava/lang/String;

.field private capabilityvalue:Ljava/lang/String;

.field private checkingStatus:Ljava/lang/String;

.field private countDownEndTime:Ljava/lang/String;

.field private currentState:Ljava/lang/String;

.field private customizedState:Ljava/lang/String;

.field private deviceId:Ljava/lang/String;

.field private deviceIdAvailablity:Ljava/lang/String;

.field private deviceIndex:Ljava/lang/String;

.field private deviceListType:Ljava/lang/String;

.field private discoveryState:Ljava/lang/String;

.field private endDiscoveryTime:J

.field private firmwareVersion:Ljava/lang/String;

.field private foundTime:Ljava/lang/String;

.field private friendlyName:Ljava/lang/String;

.field private fwStatus:Ljava/lang/String;

.field private groupCapabilities:Ljava/lang/String;

.field private groupCapabilityID:Ljava/lang/String;

.field private groupID:Ljava/lang/String;

.field private groupIcon:Ljava/lang/String;

.field private groupName:Ljava/lang/String;

.field public groupedDevices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end field

.field private hide:I

.field private homeID:Ljava/lang/String;

.field private html:Ljava/lang/String;

.field private hwVersion:Ljava/lang/String;

.field private icon:Ljava/lang/String;

.field private iconURL:Ljava/lang/String;

.field private iconUploadId:Ljava/lang/String;

.field private iconVersion:Ljava/lang/String;

.field private inActive:I

.field private info:Ljava/lang/String;

.field private isDiscovered:Z

.field private isGroupAction:Ljava/lang/String;

.field private isRemote:Z

.field private lastEventTimeStamp:I

.field private lastSeen:Ljava/lang/String;

.field private lastTimestamp:Ljava/lang/String;

.field private ledGroupCapability:Ljava/lang/String;

.field mDevice:Lorg/cybergarage/upnp/Device;

.field private mac:Ljava/lang/String;

.field private manufacturerName:Ljava/lang/String;

.field private modelCode:Ljava/lang/String;

.field private needIconUpdate:Z

.field private notificationType:Ljava/lang/String;

.field private parentExternalId:Ljava/lang/String;

.field private parentName:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;

.field private port:I

.field private productName:Ljava/lang/String;

.field private productType:Ljava/lang/String;

.field private rulesDBVersion:I

.field private serialNumber:Ljava/lang/String;

.field private signalStrength:Ljava/lang/String;

.field private ssid:Ljava/lang/String;

.field private startDiscoveryTime:J

.field private state:I

.field private statusTS:I

.field private timestamp:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private wemoCertified:Ljava/lang/String;

.field private whichDiscovered:Ljava/lang/String;

.field private whichFound:Ljava/lang/String;

.field private zigbee:Z


# direct methods
.method public constructor <init>()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    .line 62
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    .line 67
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    .line 68
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 72
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    .line 77
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    .line 78
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDCapabilities:Ljava/lang/String;

    .line 79
    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupID:I

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupName:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ledGroupCapability:Ljava/lang/String;

    .line 82
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    .line 83
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    .line 84
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 85
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 86
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    .line 90
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->zigbee:Z

    .line 92
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 96
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    .line 99
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastTimestamp:Ljava/lang/String;

    .line 100
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->html:Ljava/lang/String;

    .line 101
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    .line 103
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIndex:Ljava/lang/String;

    .line 104
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceListType:Ljava/lang/String;

    .line 105
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceId:Ljava/lang/String;

    .line 106
    const-string v0, "0"

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 107
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    .line 108
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->currentState:Ljava/lang/String;

    .line 109
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    .line 110
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    .line 111
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilityID:Ljava/lang/String;

    .line 112
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    .line 113
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilities:Ljava/lang/String;

    .line 114
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 115
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 116
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    .line 117
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    .line 118
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 119
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 120
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 121
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->availablity:Z

    .line 125
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isRemote:Z

    .line 127
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    .line 128
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    .line 131
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    .line 135
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    .line 136
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentName:Ljava/lang/String;

    .line 138
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentExternalId:Ljava/lang/String;

    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .param p1, "deviceUDN"    # Ljava/lang/String;
    .param p2, "devIP"    # Ljava/lang/String;
    .param p3, "port"    # I

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    .line 62
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    .line 67
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    .line 68
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 72
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    .line 77
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    .line 78
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDCapabilities:Ljava/lang/String;

    .line 79
    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupID:I

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupName:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ledGroupCapability:Ljava/lang/String;

    .line 82
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    .line 83
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    .line 84
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 85
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 86
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    .line 90
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->zigbee:Z

    .line 92
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 96
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    .line 99
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastTimestamp:Ljava/lang/String;

    .line 100
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->html:Ljava/lang/String;

    .line 101
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    .line 103
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIndex:Ljava/lang/String;

    .line 104
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceListType:Ljava/lang/String;

    .line 105
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceId:Ljava/lang/String;

    .line 106
    const-string v0, "0"

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 107
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    .line 108
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->currentState:Ljava/lang/String;

    .line 109
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    .line 110
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    .line 111
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilityID:Ljava/lang/String;

    .line 112
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    .line 113
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilities:Ljava/lang/String;

    .line 114
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 115
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 116
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    .line 117
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    .line 118
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 119
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 120
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 121
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->availablity:Z

    .line 125
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isRemote:Z

    .line 127
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    .line 128
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    .line 131
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    .line 135
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    .line 136
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentName:Ljava/lang/String;

    .line 138
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentExternalId:Ljava/lang/String;

    .line 149
    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    .line 151
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIP(Ljava/lang/String;)V

    .line 152
    invoke-virtual {p0, p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setPort(I)V

    .line 153
    return-void

    .line 149
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "LEDbridgeUDN"    # Ljava/lang/String;
    .param p2, "LEDUniqueID"    # Ljava/lang/String;
    .param p3, "LEDstate"    # I
    .param p4, "LEDCapabilities"    # Ljava/lang/String;
    .param p5, "LEDicon"    # Ljava/lang/String;
    .param p6, "LEDfirmwareVersion"    # Ljava/lang/String;
    .param p7, "LEDmodelCode"    # Ljava/lang/String;
    .param p8, "LEDFriendlyName"    # Ljava/lang/String;
    .param p9, "pluginID"    # Ljava/lang/String;

    .prologue
    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 55
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 56
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 57
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 58
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 61
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    .line 62
    const/4 v1, -0x1

    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    .line 63
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 64
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 65
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 66
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    .line 67
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    .line 68
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 69
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    .line 71
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 72
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 73
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    .line 74
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    .line 76
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    .line 77
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    .line 78
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDCapabilities:Ljava/lang/String;

    .line 79
    const/4 v1, 0x0

    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupID:I

    .line 80
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupName:Ljava/lang/String;

    .line 81
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ledGroupCapability:Ljava/lang/String;

    .line 82
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    .line 83
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    .line 84
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 85
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 86
    const/4 v1, -0x1

    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    .line 90
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->zigbee:Z

    .line 92
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 94
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 96
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    .line 97
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    .line 98
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    .line 99
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastTimestamp:Ljava/lang/String;

    .line 100
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->html:Ljava/lang/String;

    .line 101
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    .line 102
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    .line 103
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIndex:Ljava/lang/String;

    .line 104
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceListType:Ljava/lang/String;

    .line 105
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceId:Ljava/lang/String;

    .line 106
    const-string v1, "0"

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 107
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    .line 108
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->currentState:Ljava/lang/String;

    .line 109
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    .line 110
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    .line 111
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilityID:Ljava/lang/String;

    .line 112
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    .line 113
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilities:Ljava/lang/String;

    .line 114
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 115
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 116
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    .line 117
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    .line 118
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 119
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 120
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 121
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->availablity:Z

    .line 125
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isRemote:Z

    .line 127
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    .line 128
    const/4 v1, -0x1

    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    .line 131
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 134
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    .line 135
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    .line 136
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    .line 137
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentName:Ljava/lang/String;

    .line 138
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentExternalId:Ljava/lang/String;

    .line 221
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    .line 222
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    .line 223
    iput-object p2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    .line 225
    iput p3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    .line 226
    iput-object p4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    .line 228
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->extractCapabilities(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    :goto_0
    iput-object p5, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 233
    iput-object p6, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 234
    iput-object p7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 235
    iput-object p8, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 236
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->zigbee:Z

    .line 237
    iput-object p9, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 239
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "New LED Device. BridgeUDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; UniqueID: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; State: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Friendly Name: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; capabilities: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    return-void

    .line 229
    :catch_0
    move-exception v0

    .line 230
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v2, "JSONException while parsing capabilities: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "deviceUDN"    # Ljava/lang/String;
    .param p2, "homeId"    # Ljava/lang/String;
    .param p3, "devMAC"    # Ljava/lang/String;
    .param p4, "pluginId"    # Ljava/lang/String;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    .line 62
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    .line 67
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    .line 68
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 72
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    .line 77
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    .line 78
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDCapabilities:Ljava/lang/String;

    .line 79
    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupID:I

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupName:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ledGroupCapability:Ljava/lang/String;

    .line 82
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    .line 83
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    .line 84
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 85
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 86
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    .line 90
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->zigbee:Z

    .line 92
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 96
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    .line 99
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastTimestamp:Ljava/lang/String;

    .line 100
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->html:Ljava/lang/String;

    .line 101
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    .line 103
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIndex:Ljava/lang/String;

    .line 104
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceListType:Ljava/lang/String;

    .line 105
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceId:Ljava/lang/String;

    .line 106
    const-string v0, "0"

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 107
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    .line 108
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->currentState:Ljava/lang/String;

    .line 109
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    .line 110
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    .line 111
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilityID:Ljava/lang/String;

    .line 112
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    .line 113
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilities:Ljava/lang/String;

    .line 114
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 115
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 116
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    .line 117
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    .line 118
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 119
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 120
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 121
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->availablity:Z

    .line 125
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isRemote:Z

    .line 127
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    .line 128
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    .line 131
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    .line 135
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    .line 136
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentName:Ljava/lang/String;

    .line 138
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentExternalId:Ljava/lang/String;

    .line 168
    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    .line 170
    iput-object p2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    .line 171
    iput-object p3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 172
    iput-object p4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 174
    return-void

    .line 168
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 14
    .param p1, "deviceUDN"    # Ljava/lang/String;
    .param p2, "devType"    # Ljava/lang/String;
    .param p3, "devFriendlyName"    # Ljava/lang/String;
    .param p4, "devIcon"    # Ljava/lang/String;
    .param p5, "devState"    # I
    .param p6, "makerAttrList"    # Ljava/lang/String;
    .param p7, "devInActive"    # I
    .param p8, "devModelName"    # Ljava/lang/String;
    .param p9, "devCustomizedState"    # Ljava/lang/String;
    .param p10, "devFWVersion"    # Ljava/lang/String;
    .param p11, "devInfo"    # Ljava/lang/String;
    .param p12, "devFWStatus"    # Ljava/lang/String;
    .param p13, "lastSeen"    # Ljava/lang/String;
    .param p14, "hide"    # I

    .prologue
    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    .line 67
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    .line 68
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 72
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    .line 77
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    .line 78
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDCapabilities:Ljava/lang/String;

    .line 79
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupID:I

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupName:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ledGroupCapability:Ljava/lang/String;

    .line 82
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    .line 83
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    .line 84
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 86
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    .line 90
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->zigbee:Z

    .line 92
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 96
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    .line 99
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastTimestamp:Ljava/lang/String;

    .line 100
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->html:Ljava/lang/String;

    .line 101
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    .line 103
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIndex:Ljava/lang/String;

    .line 104
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceListType:Ljava/lang/String;

    .line 105
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceId:Ljava/lang/String;

    .line 106
    const-string v0, "0"

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 107
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    .line 108
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->currentState:Ljava/lang/String;

    .line 109
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    .line 110
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    .line 111
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilityID:Ljava/lang/String;

    .line 112
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    .line 113
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilities:Ljava/lang/String;

    .line 114
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 115
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 116
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    .line 118
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 119
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 121
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->availablity:Z

    .line 125
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isRemote:Z

    .line 127
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    .line 128
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    .line 131
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    .line 135
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    .line 136
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentName:Ljava/lang/String;

    .line 138
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentExternalId:Ljava/lang/String;

    .line 181
    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p6

    move/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move-object/from16 v10, p11

    move-object/from16 v11, p12

    move-object/from16 v12, p13

    move/from16 v13, p14

    .line 183
    invoke-virtual/range {v0 .. v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->update(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 184
    return-void

    .line 181
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "state"    # Ljava/lang/String;
    .param p3, "icon"    # Ljava/lang/String;
    .param p4, "iconURL"    # Ljava/lang/String;
    .param p5, "UDN"    # Ljava/lang/String;
    .param p6, "discoveryState"    # Ljava/lang/String;
    .param p7, "type"    # Ljava/lang/String;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    .line 62
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    .line 67
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    .line 68
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 72
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    .line 77
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    .line 78
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDCapabilities:Ljava/lang/String;

    .line 79
    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupID:I

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupName:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ledGroupCapability:Ljava/lang/String;

    .line 82
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    .line 83
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    .line 84
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 85
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 86
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    .line 90
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->zigbee:Z

    .line 92
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 96
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    .line 99
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastTimestamp:Ljava/lang/String;

    .line 100
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->html:Ljava/lang/String;

    .line 101
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    .line 103
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIndex:Ljava/lang/String;

    .line 104
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceListType:Ljava/lang/String;

    .line 105
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceId:Ljava/lang/String;

    .line 106
    const-string v0, "0"

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 107
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    .line 108
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->currentState:Ljava/lang/String;

    .line 109
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    .line 110
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    .line 111
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilityID:Ljava/lang/String;

    .line 112
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    .line 113
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilities:Ljava/lang/String;

    .line 114
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 115
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 116
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    .line 117
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    .line 118
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 119
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 120
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 121
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->availablity:Z

    .line 125
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isRemote:Z

    .line 127
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    .line 128
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    .line 131
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    .line 135
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    .line 136
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentName:Ljava/lang/String;

    .line 138
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentExternalId:Ljava/lang/String;

    .line 245
    if-eqz p5, :cond_0

    invoke-static {p5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 246
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    .line 248
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 249
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    .line 250
    iput-object p3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 251
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating DeviceInformation instance - 1. icon: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    iput-object p4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 254
    iput-object p6, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->discoveryState:Ljava/lang/String;

    .line 255
    iput-object p7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 256
    return-void

    .line 245
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public constructor <init>(Lorg/cybergarage/upnp/Device;)V
    .locals 6
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 55
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 56
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 57
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 58
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    .line 62
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    .line 63
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    .line 67
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    .line 68
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 72
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 73
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    .line 74
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    .line 76
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    .line 77
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    .line 78
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDCapabilities:Ljava/lang/String;

    .line 79
    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupID:I

    .line 80
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupName:Ljava/lang/String;

    .line 81
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ledGroupCapability:Ljava/lang/String;

    .line 82
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    .line 83
    iput-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    .line 84
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 85
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 86
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    .line 90
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->zigbee:Z

    .line 92
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 94
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 96
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    .line 99
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastTimestamp:Ljava/lang/String;

    .line 100
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->html:Ljava/lang/String;

    .line 101
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    .line 103
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIndex:Ljava/lang/String;

    .line 104
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceListType:Ljava/lang/String;

    .line 105
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceId:Ljava/lang/String;

    .line 106
    const-string v0, "0"

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 107
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    .line 108
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->currentState:Ljava/lang/String;

    .line 109
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    .line 110
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    .line 111
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilityID:Ljava/lang/String;

    .line 112
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    .line 113
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilities:Ljava/lang/String;

    .line 114
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 115
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 116
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    .line 117
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    .line 118
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 119
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 120
    iput-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 121
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->availablity:Z

    .line 125
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isRemote:Z

    .line 127
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    .line 128
    iput v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    .line 131
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    .line 135
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    .line 136
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    .line 137
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentName:Ljava/lang/String;

    .line 138
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentExternalId:Ljava/lang/String;

    .line 156
    if-nez p1, :cond_0

    .line 157
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 159
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 160
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 161
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    .line 162
    invoke-direct {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setParametersFromDevice()V

    .line 164
    return-void

    .line 160
    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/json/JSONObject;Ljava/util/Iterator;[Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .param p2, "x2"    # Ljava/util/Iterator;
    .param p3, "x3"    # [Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->parseActionResponseToJSON(Lorg/json/JSONObject;Ljava/util/Iterator;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$402(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    return p1
.end method

.method static synthetic access$500(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$700(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    return-object v0
.end method

.method private changeModelName(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 1066
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1067
    const-string v4, ""

    .line 1090
    :goto_0
    return-object v4

    .line 1069
    :cond_0
    const-string v0, ""

    .line 1070
    .local v0, "changedModelName":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " ModelName Incorrect: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1071
    const-string v4, "-"

    invoke-virtual {p1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1072
    const-string v4, "-"

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 1073
    .local v2, "part":[Ljava/lang/String;
    array-length v4, v2

    if-lez v4, :cond_1

    .line 1074
    const/4 v4, 0x0

    aget-object v1, v2, v4

    .line 1075
    .local v1, "firstPart":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " firstPart: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1076
    const-string v4, ":"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1077
    const-string v4, ":"

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 1079
    .local v3, "part2":[Ljava/lang/String;
    array-length v4, v3

    if-le v4, v7, :cond_1

    .line 1080
    aget-object v0, v3, v7

    .line 1081
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " changedModelName: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1090
    .end local v1    # "firstPart":Ljava/lang/String;
    .end local v2    # "part":[Ljava/lang/String;
    .end local v3    # "part2":[Ljava/lang/String;
    :cond_1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method private extractCapabilities(Lorg/json/JSONObject;)V
    .locals 14
    .param p1, "capabilitiesJO"    # Lorg/json/JSONObject;

    .prologue
    .line 975
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "extractCapabilities: capabilities JO received: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; UDN: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 977
    const/4 v0, 0x0

    .line 978
    .local v0, "capabilityIDList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 979
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "capabilityIDList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 983
    .restart local v0    # "capabilityIDList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 984
    .local v1, "capabilityIDListSize":I
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "extractCapabilities: Existing capability IDs: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; SIZE: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 987
    const/4 v2, 0x0

    .line 988
    .local v2, "capabilityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 989
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "capabilityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 993
    .restart local v2    # "capabilityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    .line 994
    .local v3, "capabilityValueListSize":I
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "extractCapabilities: Existing capability Values: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; SIZE: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 996
    if-ge v3, v1, :cond_2

    .line 997
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    sub-int v11, v1, v3

    if-ge v5, v11, :cond_2

    .line 998
    const-string v11, ""

    invoke-interface {v2, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 997
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 981
    .end local v1    # "capabilityIDListSize":I
    .end local v2    # "capabilityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "capabilityValueListSize":I
    .end local v5    # "i":I
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "capabilityIDList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    const-string v12, "\\s*,\\s*"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-direct {v0, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .restart local v0    # "capabilityIDList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_0

    .line 991
    .restart local v1    # "capabilityIDListSize":I
    .restart local v2    # "capabilityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "capabilityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    const-string v12, "\\s*,\\s*"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-direct {v2, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .restart local v2    # "capabilityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_1

    .line 1002
    .restart local v3    # "capabilityValueListSize":I
    :cond_2
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v8

    .line 1004
    .local v8, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_4

    .line 1006
    :try_start_0
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 1007
    .local v7, "key":Ljava/lang/String;
    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1009
    .local v10, "value":Ljava/lang/String;
    invoke-static {v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getCapabilityIDFromTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1010
    .local v9, "singleCapabilityID":Ljava/lang/String;
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "extractCapabilities: New capability key: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; value: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; corresponding ID: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1013
    invoke-interface {v0, v9}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    .line 1014
    .local v6, "index":I
    const/4 v11, -0x1

    if-ne v6, v11, :cond_3

    .line 1016
    const/4 v11, 0x0

    invoke-interface {v0, v11, v9}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 1017
    const/4 v11, 0x0

    invoke-interface {v2, v11, v10}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 1023
    .end local v6    # "index":I
    .end local v7    # "key":Ljava/lang/String;
    .end local v9    # "singleCapabilityID":Ljava/lang/String;
    .end local v10    # "value":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 1024
    .local v4, "e":Lorg/json/JSONException;
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v12, "extractCapabilities: JSONException while extracting capabilities: "

    invoke-static {v11, v12, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_3

    .line 1020
    .end local v4    # "e":Lorg/json/JSONException;
    .restart local v6    # "index":I
    .restart local v7    # "key":Ljava/lang/String;
    .restart local v9    # "singleCapabilityID":Ljava/lang/String;
    .restart local v10    # "value":Ljava/lang/String;
    :cond_3
    :try_start_1
    invoke-interface {v2, v6, v10}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 1029
    .end local v6    # "index":I
    .end local v7    # "key":Ljava/lang/String;
    .end local v9    # "singleCapabilityID":Ljava/lang/String;
    .end local v10    # "value":Ljava/lang/String;
    :cond_4
    const-string v11, ","

    invoke-static {v11, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    .line 1030
    const-string v11, ","

    invoke-static {v11, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    .line 1032
    iget-object v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "extractCapabilities: UPDATED Capability IDs: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "; UPDATED Capability Values: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1033
    return-void
.end method

.method private fetchIconFromDevice()V
    .locals 3

    .prologue
    .line 1492
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/icon.jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 1493
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveIconToStorage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 1495
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Custom Icon - Downloading icon from URL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Downloaded Icon: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Object: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1496
    return-void
.end method

.method private fetchNightModeConfiguration()V
    .locals 6

    .prologue
    .line 1499
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v5, "fetchNightModeConfiguration: STARTING..."

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1500
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    if-eqz v4, :cond_2

    .line 1501
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    const-string v5, "GetNightModeConfiguration"

    invoke-virtual {v4, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1502
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_1

    .line 1503
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v3

    .line 1504
    .local v3, "response":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1505
    new-instance v4, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;

    invoke-direct {v4}, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;-><init>()V

    invoke-virtual {v4, v3}, Lcom/belkin/wemo/upnp/parser/GetNightModeConfigurationResponseParser;->parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/NightModeConfiguration;

    move-result-object v1

    .line 1507
    .local v1, "configuration":Lcom/belkin/wemo/upnp/response/NightModeConfiguration;
    :try_start_0
    const-string v4, "nightMode"

    invoke-virtual {v1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->getNightMode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1508
    const-string v4, "startTime"

    invoke-virtual {v1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->getStartTime()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1509
    const-string v4, "endTime"

    invoke-virtual {v1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->getEndTime()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1510
    const-string v4, "nightModeBrightness"

    invoke-virtual {v1}, Lcom/belkin/wemo/upnp/response/NightModeConfiguration;->getNightModeBrightness()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1523
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "configuration":Lcom/belkin/wemo/upnp/response/NightModeConfiguration;
    .end local v3    # "response":Ljava/lang/String;
    :goto_0
    return-void

    .line 1511
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "configuration":Lcom/belkin/wemo/upnp/response/NightModeConfiguration;
    .restart local v3    # "response":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 1512
    .local v2, "e":Lorg/json/JSONException;
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v5, "fetchNightModeConfiguration: JSONException while setting attributes: "

    invoke-static {v4, v5, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 1515
    .end local v1    # "configuration":Lcom/belkin/wemo/upnp/response/NightModeConfiguration;
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v5, "fetchNightModeConfiguration: GetNightModeConfiguration Action Response is EMPTY"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1518
    .end local v3    # "response":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v5, "fetchNightModeConfiguration: GetNightModeConfiguration Action is NULL"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1521
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    :cond_2
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v5, "fetchNightModeConfiguration: Control Point device is null"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getAttributeList(Lorg/cybergarage/upnp/Device;)Lorg/json/JSONObject;
    .locals 11
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1097
    const/4 v3, 0x0

    .line 1099
    .local v3, "attributeList":Lorg/json/JSONObject;
    if-nez p1, :cond_0

    .line 1100
    const/4 v8, 0x0

    .line 1130
    :goto_0
    return-object v8

    .line 1102
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v7

    .line 1105
    .local v7, "udn":Ljava/lang/String;
    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1106
    const-string v8, "GetCrockpotState"

    invoke-virtual {p1, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1107
    .local v0, "actionObj":Lorg/cybergarage/upnp/Action;
    if-nez v0, :cond_1

    .line 1108
    new-instance v8, Ljava/lang/Exception;

    const-string v9, "Invalid action GetCrockpotState"

    invoke-direct {v8, v9}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1110
    :cond_1
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v6

    .line 1111
    .local v6, "response":Ljava/lang/String;
    iget-object v8, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "GetCrockpotState response: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1112
    if-eqz v6, :cond_4

    .line 1113
    new-instance v3, Lorg/json/JSONObject;

    .end local v3    # "attributeList":Lorg/json/JSONObject;
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 1114
    .restart local v3    # "attributeList":Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/ArgumentList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1115
    .local v4, "elems":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 1116
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/Argument;

    .line 1117
    .local v1, "argument":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Argument;->getName()Ljava/lang/String;

    move-result-object v5

    .line 1118
    .local v5, "name":Ljava/lang/String;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 1119
    .local v2, "attribute":Lorg/json/JSONObject;
    const-string v8, "name"

    invoke-virtual {v2, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1120
    const-string v8, "value"

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1121
    invoke-virtual {v3, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 1124
    .end local v0    # "actionObj":Lorg/cybergarage/upnp/Action;
    .end local v1    # "argument":Lorg/cybergarage/upnp/Argument;
    .end local v2    # "attribute":Lorg/json/JSONObject;
    .end local v4    # "elems":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "response":Ljava/lang/String;
    :cond_2
    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/IsDevice;->Smart(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/IsDevice;->Maker(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 1125
    :cond_3
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getAttributetParameterFromDevice()Lorg/json/JSONObject;

    move-result-object v3

    .line 1129
    :cond_4
    :goto_2
    iget-object v8, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "attributeList for UDN:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " --"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    move-object v8, v3

    .line 1130
    goto/16 :goto_0

    .line 1126
    :cond_5
    invoke-static {v7}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 1127
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInsightData()V

    goto :goto_2
.end method

.method private getDiscoveryTimeString()Ljava/lang/String;
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 730
    iget-wide v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    iget-wide v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    iget-wide v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    iget-wide v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    .line 732
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDiscoveryTime()J

    move-result-wide v2

    long-to-int v2, v2

    div-int/lit16 v1, v2, 0x3e8

    .line 733
    .local v1, "speed":I
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDiscoveryTime()J

    move-result-wide v2

    long-to-int v2, v2

    rem-int/lit16 v2, v2, 0x3e8

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 734
    .local v0, "ms":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    .line 735
    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 736
    :cond_0
    if-lez v1, :cond_1

    .line 737
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 741
    .end local v0    # "ms":Ljava/lang/String;
    .end local v1    # "speed":I
    :goto_0
    return-object v2

    .line 739
    .restart local v0    # "ms":Ljava/lang/String;
    .restart local v1    # "speed":I
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "0:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 741
    .end local v0    # "ms":Ljava/lang/String;
    .end local v1    # "speed":I
    :cond_2
    const-string v2, ""

    goto :goto_0
.end method

.method private parseActionResponseToJSON(Lorg/json/JSONObject;Ljava/util/Iterator;[Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "attrList"    # Lorg/json/JSONObject;
    .param p3, "parameters"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/Iterator",
            "<*>;[",
            "Ljava/lang/String;",
            ")",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .prologue
    .line 1163
    .local p2, "params":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    const/4 v3, 0x0

    .line 1165
    .local v3, "pos":I
    :goto_0
    :try_start_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1166
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/Argument;

    .line 1167
    .local v0, "argument":Lorg/cybergarage/upnp/Argument;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 1168
    .local v1, "attribute":Lorg/json/JSONObject;
    const-string v4, "value"

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1169
    aget-object v4, p3, v3

    invoke-virtual {p1, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1170
    add-int/lit8 v3, v3, 0x1

    .line 1171
    goto :goto_0

    .line 1172
    .end local v0    # "argument":Lorg/cybergarage/upnp/Argument;
    .end local v1    # "attribute":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 1173
    .local v2, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v5, "Exception while getting insight attributes "

    invoke-static {v4, v5, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1175
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    return-object p1
.end method

.method private refreshGetInformationAttributes(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1276
    .local p1, "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_5

    .line 1278
    const-string v1, "firmwareVersion"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 1279
    const-string v1, "FriendlyName"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 1280
    const-string v1, "binaryState"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 1281
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1282
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    .line 1284
    :cond_0
    const-string v1, "iconVersion"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 1285
    const-string v1, "CustomizedState"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 1286
    const-string v1, "CountdownEndTime"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->countDownEndTime:Ljava/lang/String;

    .line 1287
    const-string v1, "hwVersion"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hwVersion:Ljava/lang/String;

    .line 1288
    const-string v1, "macAddress"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 1289
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hwVersion:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hwVersion:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1290
    :cond_1
    const-string v1, "v1"

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hwVersion:Ljava/lang/String;

    .line 1293
    :cond_2
    const-string v1, "brandName"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1294
    const-string v1, "brandName"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->brandName:Ljava/lang/String;

    .line 1297
    :cond_3
    const-string v1, "productName"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 1298
    const-string v1, "productName"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 1302
    :cond_4
    :try_start_0
    const-string v2, "brightness"

    const-string v1, "brightness"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1303
    const-string v2, "fader"

    const-string v1, "fader"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1304
    const-string v2, "nightMode"

    const-string v1, "nightMode"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1305
    const-string v2, "startTime"

    const-string v1, "startTime"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1306
    const-string v2, "endTime"

    const-string v1, "endTime"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1307
    const-string v2, "nightModeBrightness"

    const-string v1, "nightModeBrightness"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1308
    const-string v2, "hushMode"

    const-string v1, "hushMode"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1310
    const-string v2, "longPressRuleDeviceCnt"

    const-string v1, "longPressRuleDeviceCnt"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1311
    const-string v2, "longPressRuleDeviceUdn"

    const-string v1, "longPressRuleDeviceUdn"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1312
    const-string v2, "longPressRuleAction"

    const-string v1, "longPressRuleAction"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1313
    const-string v2, "longPressRuleState"

    const-string v1, "longPressRuleState"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1314
    const-string v2, "overTemp"

    const-string v1, "OverTemp"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1316
    const-string v2, "bulbType"

    const-string v1, "bulbType"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1322
    :cond_5
    :goto_0
    return-void

    .line 1318
    :catch_0
    move-exception v0

    .line 1319
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v2, "JSONException while setting brightness / fader / long press rule info from GetInformation action"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private declared-synchronized setParametersFromDevice()V
    .locals 22

    .prologue
    .line 1326
    monitor-enter p0

    const/4 v9, 0x0

    .line 1327
    .local v9, "deviceInformation":[Ljava/lang/String;
    const/4 v8, 0x0

    .line 1328
    .local v8, "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 1329
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 1330
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 1331
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getMacAddress()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 1332
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getSerialNumber()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    .line 1333
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getIPAddress()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIP(Ljava/lang/String;)V

    .line 1334
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getPort()I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setPort(I)V

    .line 1336
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "DeviceInformation: New IP: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "; PORT: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->port:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1337
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getModelName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 1338
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->verifyModelName(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_0

    .line 1339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->changeModelName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1340
    .local v7, "changedName":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_0

    .line 1341
    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 1345
    .end local v7    # "changedName":Ljava/lang/String;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getProductName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 1346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_7

    .line 1347
    sget-object v19, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    invoke-static/range {v19 .. v19}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 1351
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " setting productName "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1352
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getProductType()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 1353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_8

    .line 1354
    sget-object v19, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    invoke-static/range {v19 .. v19}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 1359
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " setting productType "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1361
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList(Lorg/cybergarage/upnp/Device;)Lorg/json/JSONObject;

    move-result-object v18

    .line 1362
    .local v18, "response":Lorg/json/JSONObject;
    if-eqz v18, :cond_1

    .line 1363
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1369
    .end local v18    # "response":Lorg/json/JSONObject;
    :cond_1
    :goto_2
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " attribute List: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1370
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    const-string v20, "GetInformation"

    invoke-virtual/range {v19 .. v20}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v4

    .line 1371
    .local v4, "actionGetInformation":Lorg/cybergarage/upnp/Action;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    const-string v20, "GetDeviceInformation"

    invoke-virtual/range {v19 .. v20}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v3

    .line 1372
    .local v3, "actionGetDeviceInformation":Lorg/cybergarage/upnp/Action;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    const-string v20, "GetMetaInfo"

    invoke-virtual/range {v19 .. v20}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v6

    .line 1373
    .local v6, "actionGetMetaInfo":Lorg/cybergarage/upnp/Action;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    const-string v20, "GetExtMetaInfo"

    invoke-virtual/range {v19 .. v20}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v5

    .line 1376
    .local v5, "actionGetMetaExInfo":Lorg/cybergarage/upnp/Action;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Fetching MetaInfo for device: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1377
    if-eqz v6, :cond_2

    .line 1378
    invoke-virtual {v6}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v18

    .line 1379
    .local v18, "response":Ljava/lang/String;
    if-eqz v18, :cond_2

    .line 1380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "GetMetaInfo Response: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1381
    new-instance v16, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;

    invoke-direct/range {v16 .. v16}, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;-><init>()V

    .line 1382
    .local v16, "parser":Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;->parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/MetaInfo;

    move-result-object v14

    .line 1383
    .local v14, "metaInfo":Lcom/belkin/wemo/upnp/response/MetaInfo;
    invoke-virtual {v14}, Lcom/belkin/wemo/upnp/response/MetaInfo;->getSSID()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setSSID(Ljava/lang/String;)V

    .line 1384
    invoke-virtual {v14}, Lcom/belkin/wemo/upnp/response/MetaInfo;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 1389
    .end local v14    # "metaInfo":Lcom/belkin/wemo/upnp/response/MetaInfo;
    .end local v16    # "parser":Lcom/belkin/wemo/upnp/parser/GetMetaInfoResponseParser;
    .end local v18    # "response":Ljava/lang/String;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Fetching ExtMetaInfo for device: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1390
    if-eqz v5, :cond_a

    .line 1391
    invoke-virtual {v5}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v18

    .line 1392
    .restart local v18    # "response":Ljava/lang/String;
    if-eqz v18, :cond_9

    .line 1393
    new-instance v16, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;

    invoke-direct/range {v16 .. v16}, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;-><init>()V

    .line 1394
    .local v16, "parser":Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;->parseResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/ExtMetaInfo;

    move-result-object v12

    .line 1395
    .local v12, "extMetaInfo":Lcom/belkin/wemo/upnp/response/ExtMetaInfo;
    invoke-virtual {v12}, Lcom/belkin/wemo/upnp/response/ExtMetaInfo;->getFwStatus()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 1405
    .end local v12    # "extMetaInfo":Lcom/belkin/wemo/upnp/response/ExtMetaInfo;
    .end local v16    # "parser":Lcom/belkin/wemo/upnp/parser/GetExtMetaInfoResponseParser;
    .end local v18    # "response":Ljava/lang/String;
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    move-object/from16 v17, v0

    .line 1407
    .local v17, "prevIconVersion":Ljava/lang/String;
    if-eqz v4, :cond_d

    .line 1409
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getCustomizedInformationFromDevice()Ljava/util/Map;

    move-result-object v8

    .line 1411
    if-eqz v8, :cond_b

    .line 1413
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->refreshGetInformationAttributes(Ljava/util/Map;)V

    .line 1452
    :cond_3
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_11

    const/16 v19, 0x0

    :goto_5
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 1453
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    move-object/from16 v19, v0

    const-string v20, "0"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 1454
    const-string v19, ""

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 1455
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 1457
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "setParametersForDevice(): newIconVersion: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "prevIconVersion: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "; UDN: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1460
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    move/from16 v19, v0

    if-eqz v19, :cond_12

    .line 1461
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->fetchIconFromDevice()V

    .line 1474
    :cond_5
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v19

    const-string v20, "NetCam"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 1475
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    move-object/from16 v19, v0

    const-string v20, ";"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v13

    .line 1476
    .local v13, "lastIndexOfFN":I
    if-ltz v13, :cond_6

    .line 1477
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v0, v1, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 1487
    .end local v13    # "lastIndexOfFN":I
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " updateDeviceInfo customizedInformation: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " friendlyName: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " binaryState: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " iconVersion: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " udn: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " macAddress : "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " countDownEndTime : "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->countDownEndTime:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " brandName: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->brandName:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "hwVersion:"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hwVersion:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1488
    monitor-exit p0

    return-void

    .line 1349
    .end local v3    # "actionGetDeviceInformation":Lorg/cybergarage/upnp/Action;
    .end local v4    # "actionGetInformation":Lorg/cybergarage/upnp/Action;
    .end local v5    # "actionGetMetaExInfo":Lorg/cybergarage/upnp/Action;
    .end local v6    # "actionGetMetaInfo":Lorg/cybergarage/upnp/Action;
    .end local v17    # "prevIconVersion":Ljava/lang/String;
    :cond_7
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 1326
    :catchall_0
    move-exception v19

    monitor-exit p0

    throw v19

    .line 1356
    :cond_8
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    goto/16 :goto_1

    .line 1364
    :catch_0
    move-exception v11

    .line 1366
    .local v11, "e":Ljava/lang/Exception;
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_2

    .line 1397
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v3    # "actionGetDeviceInformation":Lorg/cybergarage/upnp/Action;
    .restart local v4    # "actionGetInformation":Lorg/cybergarage/upnp/Action;
    .restart local v5    # "actionGetMetaExInfo":Lorg/cybergarage/upnp/Action;
    .restart local v6    # "actionGetMetaInfo":Lorg/cybergarage/upnp/Action;
    .restart local v18    # "response":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "setParametersForDevice: GetExtMetaInfo response is null. Thus, resetting fsStatus. UDN: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1398
    const-string v19, ""

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    goto/16 :goto_3

    .line 1401
    .end local v18    # "response":Ljava/lang/String;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "setParametersForDevice: GetExtMetaInfo ACTION is null. Thus, resetting fsStatus. UDN: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1402
    const-string v19, ""

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    goto/16 :goto_3

    .line 1415
    .restart local v17    # "prevIconVersion":Ljava/lang/String;
    :cond_b
    if-eqz v3, :cond_3

    .line 1416
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getDeviceInformationFromDevice()[Ljava/lang/String;

    move-result-object v9

    .line 1417
    if-eqz v9, :cond_c

    .line 1419
    const/16 v19, 0x5

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 1420
    const/16 v19, 0x4

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 1421
    const/16 v19, 0x2

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 1423
    const/16 v19, 0x1

    aget-object v15, v9, v19

    .line 1424
    .local v15, "newVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 1425
    const/16 v19, 0x0

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 1426
    array-length v0, v9

    move/from16 v19, v0

    const/16 v20, 0x6

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_3

    .line 1427
    const/16 v19, 0x6

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->brandName:Ljava/lang/String;

    goto/16 :goto_4

    .line 1429
    .end local v15    # "newVersion":Ljava/lang/String;
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    const-string v20, "device is not reachable"

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1430
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 1431
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    goto/16 :goto_4

    .line 1435
    :cond_d
    if-nez v3, :cond_10

    .line 1437
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getFriendlyNameFromDevice()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 1439
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    if-nez v19, :cond_f

    .line 1440
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 1441
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getMacAddress()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 1442
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getBinaryStateFromDevice()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 1443
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getFirmwareVersionFromDevice()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    goto/16 :goto_4

    .line 1444
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/cybergarage/upnp/Device;->getDeviceInformationFromDevice()[Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 1445
    const/16 v19, 0x5

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 1446
    const/16 v19, 0x4

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 1447
    const/16 v19, 0x2

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 1448
    const/16 v19, 0x1

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 1449
    const/16 v19, 0x0

    aget-object v19, v9, v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    goto/16 :goto_4

    .line 1452
    :cond_11
    const/16 v19, 0x1

    goto/16 :goto_5

    .line 1464
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    move-object/from16 v19, v0

    const-string v20, "0"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_5

    .line 1466
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/belkin/wemo/storage/FileStorage;->doesCustomIconExistAtLocation(Ljava/lang/String;)Z

    move-result v10

    .line 1467
    .local v10, "doesExist":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "setParametersForDevice(): Custom Icon - Does Icon Exist: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "; Icon Location: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "; UDN: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "; Object: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-static/range {p0 .. p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1468
    if-nez v10, :cond_5

    .line 1469
    invoke-direct/range {p0 .. p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->fetchIconFromDevice()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_6
.end method

.method private verifyModelName(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "modelName"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 1058
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1059
    const/4 v0, 0x0

    .line 1062
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addLEDInGrp(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 2
    .param p1, "ledDevice"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 955
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 956
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    .line 958
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 959
    return-void
.end method

.method public getAttributeList()Lorg/json/JSONObject;
    .locals 3

    .prologue
    .line 481
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DeviceInformation: Get Attribute List called: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getAttributeValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "attribute"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1597
    const-string v1, ""

    .line 1598
    .local v1, "attrValue":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "attrList: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ";attribute: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1599
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    invoke-virtual {v2, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 1600
    .local v0, "attrValJO":Lorg/json/JSONObject;
    const-string v2, "value"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1602
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DeviceInformation: Get Attribute Value. Attr: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1603
    return-object v1
.end method

.method public getAvailablity()Z
    .locals 1

    .prologue
    .line 1542
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->availablity:Z

    return v0
.end method

.method public getBinaryState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 827
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    return-object v0
.end method

.method public getBridgeUDN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1036
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    return-object v0
.end method

.method public getCapabilities()Ljava/lang/String;
    .locals 1

    .prologue
    .line 961
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    return-object v0
.end method

.method public getCapabilityID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 876
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    return-object v0
.end method

.method public getCapabilityvalue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    return-object v0
.end method

.method public getCheckingStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 753
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->checkingStatus:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 754
    const-string v0, "First time discovered"

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->checkingStatus:Ljava/lang/String;

    .line 756
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->checkingStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getCountDownEndTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1607
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->countDownEndTime:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 884
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->currentState:Ljava/lang/String;

    return-object v0
.end method

.method public getCustomizedState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 540
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 541
    const-string v0, ""

    .line 543
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    goto :goto_0
.end method

.method public getDevice()Lorg/cybergarage/upnp/Device;
    .locals 1

    .prologue
    .line 1539
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    return-object v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 948
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceId:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceIdAvailablity()Ljava/lang/String;
    .locals 1

    .prologue
    .line 842
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceIndex()Ljava/lang/String;
    .locals 1

    .prologue
    .line 850
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIndex:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceListType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 858
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceListType:Ljava/lang/String;

    return-object v0
.end method

.method public getDiscoverySpeed()Ljava/lang/String;
    .locals 2

    .prologue
    .line 722
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->discoveryState:Ljava/lang/String;

    const-string v1, "Loaded from cloud"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->discoveryState:Ljava/lang/String;

    const-string v1, "Discovery Success"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 724
    :cond_0
    invoke-direct {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDiscoveryTimeString()Ljava/lang/String;

    move-result-object v0

    .line 726
    :goto_0
    return-object v0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method public getDiscoveryState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 445
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->discoveryState:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 446
    const-string v0, "Loaded from cache"

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->discoveryState:Ljava/lang/String;

    .line 448
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->discoveryState:Ljava/lang/String;

    return-object v0
.end method

.method public getDiscoveryTime()J
    .locals 4

    .prologue
    .line 718
    iget-wide v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    iget-wide v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public getEndDiscoveryTime()J
    .locals 2

    .prologue
    .line 710
    iget-wide v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    return-wide v0
.end method

.method public getFirmwareVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 551
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getFoundTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 473
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    return-object v0
.end method

.method public getFriendlyName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 366
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    const-string v1, "\""

    const-string v2, "&quot;"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 367
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    const-string v1, "\'"

    const-string v2, "&apos;"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 368
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getFriendlyName(): Name = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    return-object v0
.end method

.method public getFwStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 570
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 571
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 573
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupCapabilities()Ljava/lang/String;
    .locals 1

    .prologue
    .line 917
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilities:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupCapabilityID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 909
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilityID:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 893
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupIcon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1578
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 901
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupedDevices()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 941
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    return-object v0
.end method

.method public getHide()I
    .locals 1

    .prologue
    .line 646
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hide:I

    return v0
.end method

.method public getHomeID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 624
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    return-object v0
.end method

.method public getHtml()Ljava/lang/String;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->html:Ljava/lang/String;

    return-object v0
.end method

.method public getHwVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1548
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hwVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getID()I
    .locals 1

    .prologue
    .line 342
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ID:I

    return v0
.end method

.method public getIP()Ljava/lang/String;
    .locals 3

    .prologue
    .line 582
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 583
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getIPForDevice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    .line 585
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Getting IP: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 586
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 5

    .prologue
    .line 396
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getIcon(): Icon = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; UDN: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; icon version: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 397
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    const-string v3, ""

    if-ne v2, v3, :cond_1

    .line 398
    const-string v2, ""

    iput-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 399
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v3, "getIcon(): Icon version = 0. This clearing icon."

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    return-object v2

    .line 402
    :cond_1
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    invoke-static {v2}, Lcom/belkin/wemo/storage/FileStorage;->doesCustomIconExistAtLocation(Ljava/lang/String;)Z

    move-result v0

    .line 403
    .local v0, "doesExist":Z
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    const-string v3, "com.belkin.wemo.storage"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    .line 404
    .local v1, "iconValid":Z
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getIcon(): does icon exist: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    if-eqz v0, :cond_2

    if-eqz v1, :cond_0

    .line 406
    :cond_2
    const-string v2, ""

    iput-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    goto :goto_0
.end method

.method public getIconURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 418
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    return-object v0
.end method

.method public getIconUploadID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1049
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconUploadId:Ljava/lang/String;

    return-object v0
.end method

.method public getIconVersion()Ljava/lang/String;
    .locals 3

    .prologue
    .line 866
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getIconVersion(): icon version = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 867
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getInActive()I
    .locals 1

    .prologue
    .line 521
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    return v0
.end method

.method public getInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 559
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 560
    const-string v0, ""

    .line 562
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    goto :goto_0
.end method

.method public getInsightData()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 1134
    iget-object v8, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Network Mode is - "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1135
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1136
    const/4 v1, 0x0

    .line 1138
    .local v1, "actionObj":Lorg/cybergarage/upnp/Action;
    const/4 v8, 0x3

    :try_start_0
    new-array v0, v8, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "GetInsightParams"

    aput-object v9, v0, v8

    const/4 v8, 0x1

    const-string v9, "GetInsightHomeSettings"

    aput-object v9, v0, v8

    const/4 v8, 0x2

    const-string v9, "GetDataExportInfo"

    aput-object v9, v0, v8

    .line 1139
    .local v0, "actionNames":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "o":I
    :goto_0
    array-length v8, v0

    if-ge v7, v8, :cond_1

    .line 1140
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 1141
    .local v3, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v3, :cond_0

    .line 1142
    aget-object v8, v0, v7

    invoke-virtual {v3, v8}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 1143
    new-instance v2, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;

    aget-object v8, v0, v7

    const/4 v9, 0x0

    invoke-direct {v2, p0, v1, v8, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/cybergarage/upnp/Action;Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation$1;)V

    .line 1144
    .local v2, "callback":Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v8

    invoke-virtual {v8, v1, v2, v2}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1145
    const/4 v1, 0x0

    .line 1139
    .end local v2    # "callback":Lcom/belkin/wemo/cache/data/DeviceInformation$InsightGetActionCallback;
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1150
    .end local v0    # "actionNames":[Ljava/lang/String;
    .end local v3    # "device":Lorg/cybergarage/upnp/Device;
    .end local v7    # "o":I
    :catch_0
    move-exception v4

    .line 1151
    .local v4, "e":Ljava/lang/Exception;
    iput-boolean v11, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 1152
    iget-object v8, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v9, "Exception while getting insight attributes "

    invoke-static {v8, v9, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 1159
    .end local v1    # "actionObj":Lorg/cybergarage/upnp/Action;
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    return-void

    .line 1155
    :cond_2
    new-instance v6, Lcom/belkin/wemo/cache/cloud/CloudRequestGetInsightParams;

    sget-object v8, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v8}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v6, v8, p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetInsightParams;-><init>(Landroid/content/Context;Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1156
    .local v6, "insightParams":Lcom/belkin/wemo/cache/cloud/CloudRequestGetInsightParams;
    new-instance v5, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v8, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v8}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v5, v8}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 1157
    .local v5, "insightMgr":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_1
.end method

.method public getIsDiscovered()Z
    .locals 1

    .prologue
    .line 835
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    return v0
.end method

.method public getIsGroupAction()Ljava/lang/String;
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isGroupAction:Ljava/lang/String;

    return-object v0
.end method

.method public getIsRemote()Z
    .locals 1

    .prologue
    .line 1554
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isRemote:Z

    return v0
.end method

.method public getLEDGroupCapability()Ljava/lang/String;
    .locals 1

    .prologue
    .line 678
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ledGroupCapability:Ljava/lang/String;

    return-object v0
.end method

.method public getLEDGroupID()I
    .locals 1

    .prologue
    .line 662
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupID:I

    return v0
.end method

.method public getLEDGroupName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 670
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupName:Ljava/lang/String;

    return-object v0
.end method

.method public getLEDbridgeUDN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 654
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    return-object v0
.end method

.method public getLEDcapabilities()Ljava/lang/String;
    .locals 1

    .prologue
    .line 694
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDCapabilities:Ljava/lang/String;

    return-object v0
.end method

.method public getLEDuniqueID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 686
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    return-object v0
.end method

.method public getLastEventTimeStamp()I
    .locals 1

    .prologue
    .line 306
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    return v0
.end method

.method public getLastSeen()Ljava/lang/String;
    .locals 1

    .prologue
    .line 632
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 633
    const-string v0, ""

    .line 635
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    goto :goto_0
.end method

.method public getLastTimestamp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 322
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastTimestamp:Ljava/lang/String;

    return-object v0
.end method

.method public getMAC()Ljava/lang/String;
    .locals 1

    .prologue
    .line 608
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    return-object v0
.end method

.method public getManufacturerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 925
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    return-object v0
.end method

.method public getModelCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 529
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 530
    const-string v0, ""

    .line 532
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    goto :goto_0
.end method

.method public getNeedIconUpdate()Z
    .locals 1

    .prologue
    .line 1560
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    return v0
.end method

.method public getNotificationType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 283
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    return-object v0
.end method

.method public getParentExternalId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentExternalId:Ljava/lang/String;

    return-object v0
.end method

.method public getParentName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentName:Ljava/lang/String;

    return-object v0
.end method

.method public getPluginID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 616
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 3

    .prologue
    .line 595
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->port:I

    if-gtz v0, :cond_0

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 596
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getPortForDevice(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->port:I

    .line 598
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Getting Port: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->port:I

    return v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1566
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    return-object v0
.end method

.method public getProductType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1042
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    return-object v0
.end method

.method public getRulesDBVersion()I
    .locals 1

    .prologue
    .line 1615
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->rulesDBVersion:I

    return v0
.end method

.method public getSSID()Ljava/lang/String;
    .locals 3

    .prologue
    .line 379
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getSSID(): SSID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    return-object v0
.end method

.method public getSerialNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getSignalStrength()Ljava/lang/String;
    .locals 1

    .prologue
    .line 291
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    return-object v0
.end method

.method public getStartDiscoveryTime()J
    .locals 2

    .prologue
    .line 702
    iget-wide v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    return-wide v0
.end method

.method public getState()I
    .locals 2

    .prologue
    .line 426
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 427
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    .line 429
    :cond_0
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    return v0
.end method

.method public getStatusTS()I
    .locals 1

    .prologue
    .line 1572
    iget v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    return v0
.end method

.method public getTimestamp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 769
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 358
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getUDN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 350
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    return-object v0
.end method

.method public getWemoCertified()Ljava/lang/String;
    .locals 1

    .prologue
    .line 933
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    return-object v0
.end method

.method public getWhichDiscovered()Ljava/lang/String;
    .locals 1

    .prologue
    .line 745
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    return-object v0
.end method

.method public getWhichFound()Ljava/lang/String;
    .locals 1

    .prologue
    .line 465
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    return-object v0
.end method

.method public isAttributePresent(Ljava/lang/String;)Z
    .locals 4
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 486
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    .line 487
    .local v0, "hasKey":Z
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DeviceInformation: UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Is Attribute Present: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Attribute List: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 488
    return v0
.end method

.method public isZigbee()Z
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 331
    const/4 v0, 0x1

    .line 334
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public postUPnPActionGetInformtion()V
    .locals 3

    .prologue
    .line 1266
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    if-eqz v1, :cond_0

    .line 1267
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getCustomizedInformationFromDevice()Ljava/util/Map;

    move-result-object v0

    .line 1268
    .local v0, "getInformationAttrMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->refreshGetInformationAttributes(Ljava/util/Map;)V

    .line 1272
    .end local v0    # "getInformationAttrMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    return-void

    .line 1270
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v2, "refreshUPnPActionGetInformtion: Control Point device is NULL"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public removeIcon()V
    .locals 4

    .prologue
    .line 818
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 819
    .local v1, "filename":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getIconsDir()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 820
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 821
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 822
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 824
    :cond_0
    return-void
.end method

.method public saveIconToFile(Landroid/graphics/Bitmap;Landroid/content/Context;)V
    .locals 5
    .param p1, "bmp"    # Landroid/graphics/Bitmap;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 798
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 799
    .local v1, "filename":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".png"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 800
    const/4 v2, 0x0

    .line 802
    .local v2, "out":Ljava/io/FileOutputStream;
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p2, v1, v3}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v2

    .line 803
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x5a

    invoke-virtual {p1, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 808
    if-eqz v2, :cond_0

    .line 809
    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 815
    :cond_0
    :goto_0
    return-void

    .line 811
    :catch_0
    move-exception v0

    .line 812
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 804
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 805
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 808
    if-eqz v2, :cond_0

    .line 809
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 811
    :catch_2
    move-exception v0

    .line 812
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 807
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    .line 808
    if-eqz v2, :cond_1

    .line 809
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 813
    :cond_1
    :goto_1
    throw v3

    .line 811
    :catch_3
    move-exception v0

    .line 812
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public setAttributeList(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "attributeList"    # Lorg/json/JSONObject;

    .prologue
    .line 492
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DeviceInformation: Set Attribute List called. New attr list: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 493
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    .line 497
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DeviceInformation: Previous binary state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " :attributeList: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ";UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 498
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    const-string v2, "AirPurifier"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 499
    const-string v1, "mode"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 500
    const-string v1, "mode"

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    .line 509
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DeviceInformation: Updated binary state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    :goto_1
    return-void

    .line 504
    :cond_1
    const-string v1, "binaryState"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 505
    const-string v1, "binaryState"

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 510
    :catch_0
    move-exception v0

    .line 511
    .local v0, "e":Ljava/lang/NumberFormatException;
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v2, "NumberFormatException while getting binaryState value from attributes List"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 512
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v0

    .line 513
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v2, "JSONException while getting binaryState value from attributes List"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "attribute"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1585
    if-eqz p2, :cond_0

    .line 1586
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 1587
    .local v0, "attrObject":Lorg/json/JSONObject;
    const-string v1, "value"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1588
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1589
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DeviceInformation: Attribute list after update: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1594
    .end local v0    # "attrObject":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 1591
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DeviceInformation: Attribute List NOT updated as value is NULL for attribute: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setAvailablity(Z)V
    .locals 0
    .param p1, "availablity"    # Z

    .prologue
    .line 1545
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->availablity:Z

    .line 1546
    return-void
.end method

.method public setBinaryState(Ljava/lang/String;)V
    .locals 0
    .param p1, "binaryState"    # Ljava/lang/String;

    .prologue
    .line 831
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    .line 832
    return-void
.end method

.method public setBridgeUDN(Ljava/lang/String;)V
    .locals 0
    .param p1, "bridgeUDN"    # Ljava/lang/String;

    .prologue
    .line 1039
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    .line 1040
    return-void
.end method

.method public setCapabilities(Ljava/lang/String;)V
    .locals 4
    .param p1, "capabilities"    # Ljava/lang/String;

    .prologue
    .line 964
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Set Device Capabilities String: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 965
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    .line 968
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->extractCapabilities(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 972
    :goto_0
    return-void

    .line 969
    :catch_0
    move-exception v0

    .line 970
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    const-string v2, "JSONException while converting capabilities to JO: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public setCapabilityID(Ljava/lang/String;)V
    .locals 0
    .param p1, "capabilityID"    # Ljava/lang/String;

    .prologue
    .line 880
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    .line 881
    return-void
.end method

.method public setCapabilityvalue(Ljava/lang/String;)V
    .locals 0
    .param p1, "capabilityvalue"    # Ljava/lang/String;

    .prologue
    .line 303
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    .line 304
    return-void
.end method

.method public setCheckingStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "checkingStatus"    # Ljava/lang/String;

    .prologue
    .line 760
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->checkingStatus:Ljava/lang/String;

    .line 761
    return-void
.end method

.method public setCountDownEndTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "countDownEndTime"    # Ljava/lang/String;

    .prologue
    .line 1611
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->countDownEndTime:Ljava/lang/String;

    .line 1612
    return-void
.end method

.method public setCurrentState(Ljava/lang/String;)V
    .locals 3
    .param p1, "currentState"    # Ljava/lang/String;

    .prologue
    .line 888
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Set current state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 889
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->currentState:Ljava/lang/String;

    .line 890
    return-void
.end method

.method public setCustomizedState(Ljava/lang/String;)V
    .locals 0
    .param p1, "customizedState"    # Ljava/lang/String;

    .prologue
    .line 547
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 548
    return-void
.end method

.method public setDevice(Lorg/cybergarage/upnp/Device;)V
    .locals 1
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 1526
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDevice(Lorg/cybergarage/upnp/Device;Z)V

    .line 1527
    return-void
.end method

.method public setDevice(Lorg/cybergarage/upnp/Device;Z)V
    .locals 1
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "refresh"    # Z

    .prologue
    .line 1530
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 1536
    :cond_0
    :goto_0
    return-void

    .line 1532
    :cond_1
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 1533
    if-eqz p2, :cond_0

    .line 1534
    invoke-direct {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setParametersFromDevice()V

    goto :goto_0
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    .line 951
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceId:Ljava/lang/String;

    .line 952
    return-void
.end method

.method public setDeviceIdAvailablity(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceIdAvailablity"    # Ljava/lang/String;

    .prologue
    .line 846
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    .line 847
    return-void
.end method

.method public setDeviceIndex(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceIndex"    # Ljava/lang/String;

    .prologue
    .line 854
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIndex:Ljava/lang/String;

    .line 855
    return-void
.end method

.method public setDeviceListType(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceListType"    # Ljava/lang/String;

    .prologue
    .line 862
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceListType:Ljava/lang/String;

    .line 863
    return-void
.end method

.method public setDiscoveryState(Ljava/lang/String;)V
    .locals 2
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 452
    if-eqz p1, :cond_3

    .line 453
    const-string v0, "Discovery Success"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Loaded from cloud"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->discoveryState:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->discoveryState:Ljava/lang/String;

    const-string v1, "Loaded from cache"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 457
    :cond_1
    invoke-direct {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDiscoveryTimeString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    .line 458
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    .line 460
    :cond_2
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->discoveryState:Ljava/lang/String;

    .line 462
    :cond_3
    return-void
.end method

.method public setEndDiscoveryTime(J)V
    .locals 1
    .param p1, "time"    # J

    .prologue
    .line 714
    iput-wide p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->endDiscoveryTime:J

    .line 715
    return-void
.end method

.method public setFirmwareVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "firmwareVersion"    # Ljava/lang/String;

    .prologue
    .line 555
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 556
    return-void
.end method

.method public setFoundTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "foundTime"    # Ljava/lang/String;

    .prologue
    .line 477
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->foundTime:Ljava/lang/String;

    .line 478
    return-void
.end method

.method public setFriendlyName(Ljava/lang/String;)V
    .locals 3
    .param p1, "friendlyName"    # Ljava/lang/String;

    .prologue
    .line 374
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setFriendlyName(): new Name = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 376
    return-void
.end method

.method public setFwStatus(Ljava/lang/String;)V
    .locals 3
    .param p1, "fwStatus"    # Ljava/lang/String;

    .prologue
    .line 577
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting fwStatus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 578
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 579
    return-void
.end method

.method public setGroupCapabilities(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupCapabilities"    # Ljava/lang/String;

    .prologue
    .line 921
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilities:Ljava/lang/String;

    .line 922
    return-void
.end method

.method public setGroupCapabilityID(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupCapabilityID"    # Ljava/lang/String;

    .prologue
    .line 913
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupCapabilityID:Ljava/lang/String;

    .line 914
    return-void
.end method

.method public setGroupID(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupID"    # Ljava/lang/String;

    .prologue
    .line 897
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    .line 898
    return-void
.end method

.method public setGroupIcon(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupIcon"    # Ljava/lang/String;

    .prologue
    .line 1581
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    .line 1582
    return-void
.end method

.method public setGroupName(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupName"    # Ljava/lang/String;

    .prologue
    .line 905
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    .line 906
    return-void
.end method

.method public setGroupedDevices(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 945
    .local p1, "groupedDevices":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupedDevices:Ljava/util/HashMap;

    .line 946
    return-void
.end method

.method public setHide(I)V
    .locals 0
    .param p1, "hide"    # I

    .prologue
    .line 650
    iput p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hide:I

    .line 651
    return-void
.end method

.method public setHomeID(Ljava/lang/String;)V
    .locals 0
    .param p1, "homeId"    # Ljava/lang/String;

    .prologue
    .line 628
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    .line 629
    return-void
.end method

.method public setHtml(Ljava/lang/String;)V
    .locals 0
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 441
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->html:Ljava/lang/String;

    .line 442
    return-void
.end method

.method public setHwVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "hwVersion"    # Ljava/lang/String;

    .prologue
    .line 1551
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hwVersion:Ljava/lang/String;

    .line 1552
    return-void
.end method

.method public setID(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 346
    iput p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ID:I

    .line 347
    return-void
.end method

.method public setIP(Ljava/lang/String;)V
    .locals 3
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 590
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting IP: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    .line 592
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 3
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 413
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setIcon(): Icon = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 415
    return-void
.end method

.method public setIconURL(Ljava/lang/String;)V
    .locals 0
    .param p1, "iconURL"    # Ljava/lang/String;

    .prologue
    .line 422
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 423
    return-void
.end method

.method public setIconUploadId(Ljava/lang/String;)V
    .locals 3
    .param p1, "uploadID"    # Ljava/lang/String;

    .prologue
    .line 1053
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting Icon Upload ID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1054
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 1055
    return-void
.end method

.method public setIconVersion(Ljava/lang/String;)V
    .locals 3
    .param p1, "iconVersion"    # Ljava/lang/String;

    .prologue
    .line 871
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setIconVersion(): new icon version = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 872
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    .line 873
    return-void
.end method

.method public setInActive(I)V
    .locals 0
    .param p1, "inActive"    # I

    .prologue
    .line 525
    iput p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    .line 526
    return-void
.end method

.method public setInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "info"    # Ljava/lang/String;

    .prologue
    .line 566
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    .line 567
    return-void
.end method

.method public setIsDiscovered(Z)V
    .locals 0
    .param p1, "isDiscovered"    # Z

    .prologue
    .line 839
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 840
    return-void
.end method

.method public setIsGroupAction(Ljava/lang/String;)V
    .locals 0
    .param p1, "isGroupAction"    # Ljava/lang/String;

    .prologue
    .line 318
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isGroupAction:Ljava/lang/String;

    .line 319
    return-void
.end method

.method public setLEDGroupCapability(Ljava/lang/String;)V
    .locals 0
    .param p1, "ledGroupCapability"    # Ljava/lang/String;

    .prologue
    .line 682
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ledGroupCapability:Ljava/lang/String;

    .line 683
    return-void
.end method

.method public setLEDGroupID(I)V
    .locals 0
    .param p1, "ledGroupID"    # I

    .prologue
    .line 666
    iput p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupID:I

    .line 667
    return-void
.end method

.method public setLEDGroupName(Ljava/lang/String;)V
    .locals 0
    .param p1, "ledGroupName"    # Ljava/lang/String;

    .prologue
    .line 674
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDGroupName:Ljava/lang/String;

    .line 675
    return-void
.end method

.method public setLEDbridgeUDN(Ljava/lang/String;)V
    .locals 0
    .param p1, "bridgeUDN"    # Ljava/lang/String;

    .prologue
    .line 658
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDbridgeUDN:Ljava/lang/String;

    .line 659
    return-void
.end method

.method public setLEDcapabilities(Ljava/lang/String;)V
    .locals 0
    .param p1, "capabilities"    # Ljava/lang/String;

    .prologue
    .line 698
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDCapabilities:Ljava/lang/String;

    .line 699
    return-void
.end method

.method public setLEDuniqueID(Ljava/lang/String;)V
    .locals 0
    .param p1, "uniqueID"    # Ljava/lang/String;

    .prologue
    .line 690
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->LEDUniqueID:Ljava/lang/String;

    .line 691
    return-void
.end method

.method public setLastEventTimeStamp(I)V
    .locals 0
    .param p1, "lastEventTimeStamp"    # I

    .prologue
    .line 310
    iput p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    .line 311
    return-void
.end method

.method public setLastSeen(Ljava/lang/String;)V
    .locals 0
    .param p1, "lastSeen"    # Ljava/lang/String;

    .prologue
    .line 639
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    .line 640
    return-void
.end method

.method public setLastTimestamp(Ljava/lang/String;)V
    .locals 0
    .param p1, "lastTimestamp"    # Ljava/lang/String;

    .prologue
    .line 326
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastTimestamp:Ljava/lang/String;

    .line 327
    return-void
.end method

.method public setMAC(Ljava/lang/String;)V
    .locals 0
    .param p1, "mac"    # Ljava/lang/String;

    .prologue
    .line 612
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    .line 613
    return-void
.end method

.method public setManufacturerName(Ljava/lang/String;)V
    .locals 0
    .param p1, "manufacturerName"    # Ljava/lang/String;

    .prologue
    .line 929
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 930
    return-void
.end method

.method public setModelCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "modelCode"    # Ljava/lang/String;

    .prologue
    .line 536
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 537
    return-void
.end method

.method public setNeedIconUpdate(Z)V
    .locals 0
    .param p1, "needIconUpdate"    # Z

    .prologue
    .line 1563
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->needIconUpdate:Z

    .line 1564
    return-void
.end method

.method public setNotificationType(Ljava/lang/String;)V
    .locals 0
    .param p1, "notificationType"    # Ljava/lang/String;

    .prologue
    .line 287
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    .line 288
    return-void
.end method

.method public setParentExternalId(Ljava/lang/String;)V
    .locals 0
    .param p1, "parentExternalId"    # Ljava/lang/String;

    .prologue
    .line 271
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentExternalId:Ljava/lang/String;

    .line 272
    return-void
.end method

.method public setParentName(Ljava/lang/String;)V
    .locals 0
    .param p1, "parentName"    # Ljava/lang/String;

    .prologue
    .line 263
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->parentName:Ljava/lang/String;

    .line 264
    return-void
.end method

.method public setPluginId(Ljava/lang/String;)V
    .locals 0
    .param p1, "pluginID"    # Ljava/lang/String;

    .prologue
    .line 620
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    .line 621
    return-void
.end method

.method public setPort(I)V
    .locals 3
    .param p1, "port"    # I

    .prologue
    .line 603
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting Port: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 604
    iput p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->port:I

    .line 605
    return-void
.end method

.method public setProductName(Ljava/lang/String;)V
    .locals 0
    .param p1, "productName"    # Ljava/lang/String;

    .prologue
    .line 1569
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    .line 1570
    return-void
.end method

.method public setProductType(Ljava/lang/String;)V
    .locals 0
    .param p1, "productType"    # Ljava/lang/String;

    .prologue
    .line 1045
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    .line 1046
    return-void
.end method

.method public setRemote(Z)V
    .locals 0
    .param p1, "isRemote"    # Z

    .prologue
    .line 1557
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isRemote:Z

    .line 1558
    return-void
.end method

.method public setRulesDBVersion(I)V
    .locals 0
    .param p1, "rulesDBVersion"    # I

    .prologue
    .line 1619
    iput p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->rulesDBVersion:I

    .line 1620
    return-void
.end method

.method public setSSID(Ljava/lang/String;)V
    .locals 3
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 384
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSSID(): new SSID = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; UDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ssid:Ljava/lang/String;

    .line 386
    return-void
.end method

.method public setSerialNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "serialNumber"    # Ljava/lang/String;

    .prologue
    .line 279
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    .line 280
    return-void
.end method

.method public setSignalStrength(Ljava/lang/String;)V
    .locals 0
    .param p1, "signalStrength"    # Ljava/lang/String;

    .prologue
    .line 295
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    .line 296
    return-void
.end method

.method public setStartDiscoveryTime(J)V
    .locals 1
    .param p1, "time"    # J

    .prologue
    .line 706
    iput-wide p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->startDiscoveryTime:J

    .line 707
    return-void
.end method

.method public setState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 433
    iput p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    .line 434
    return-void
.end method

.method public setStatusTS(I)V
    .locals 0
    .param p1, "statusTS"    # I

    .prologue
    .line 1575
    iput p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    .line 1576
    return-void
.end method

.method public setTimestamp()V
    .locals 2

    .prologue
    .line 764
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "MM/dd/yyyy HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 765
    .local v0, "sdf":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    .line 766
    return-void
.end method

.method public setTimestamp(Ljava/lang/String;)V
    .locals 0
    .param p1, "timestamp"    # Ljava/lang/String;

    .prologue
    .line 773
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->timestamp:Ljava/lang/String;

    .line 774
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 362
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 363
    return-void
.end method

.method public setUDN(Ljava/lang/String;)V
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 354
    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    .line 355
    return-void

    .line 354
    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public setWemoCertified(Ljava/lang/String;)V
    .locals 0
    .param p1, "wemoCertified"    # Ljava/lang/String;

    .prologue
    .line 937
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 938
    return-void
.end method

.method public setWhichDiscovered(Ljava/lang/String;)V
    .locals 0
    .param p1, "whichDiscovered"    # Ljava/lang/String;

    .prologue
    .line 749
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 750
    return-void
.end method

.method public setWhichFound(Ljava/lang/String;)V
    .locals 0
    .param p1, "whichFound"    # Ljava/lang/String;

    .prologue
    .line 469
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->whichFound:Ljava/lang/String;

    .line 470
    return-void
.end method

.method public setZigbee(Z)V
    .locals 0
    .param p1, "zigbee"    # Z

    .prologue
    .line 338
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->zigbee:Z

    .line 339
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 778
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->ID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "udn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->UDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "friendlyName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "icon: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "attributeList: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "inActive: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "modelName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "customized: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "fwVersion: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "info: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "fwStatus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "ip: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->IP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "port: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "mac: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->mac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "pluginID"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "homeID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->homeID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "lastSeen"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "hide"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hide:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  Manufacturer:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->manufacturerName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " wemoCertified:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->wemoCertified:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "productType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "productName:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->productName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bridgeUDN:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "capabilities:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilities:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " statusTS:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->statusTS:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "binaryState: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->binaryState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " groupID:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " groupName:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " capabilityvalue:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityvalue:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " lastEventTimeStamp:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastEventTimeStamp:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " capabilityID:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->capabilityID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " deviceIdAvailablity:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->deviceIdAvailablity:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " isGroupAction:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isGroupAction:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; groupIcon: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->groupIcon:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Icon Version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; rulesDBVersion: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->rulesDBVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; serialNumber: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->serialNumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; notificationType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->notificationType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; signalStrength: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->signalStrength:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 794
    .local v0, "str":Ljava/lang/String;
    return-object v0
.end method

.method public update(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 5
    .param p1, "devType"    # Ljava/lang/String;
    .param p2, "devFriendlyName"    # Ljava/lang/String;
    .param p3, "devIcon"    # Ljava/lang/String;
    .param p4, "devState"    # I
    .param p5, "makerAttrList"    # Ljava/lang/String;
    .param p6, "devInActive"    # I
    .param p7, "devModelName"    # Ljava/lang/String;
    .param p8, "devCustomizedState"    # Ljava/lang/String;
    .param p9, "devFWVersion"    # Ljava/lang/String;
    .param p10, "devInfo"    # Ljava/lang/String;
    .param p11, "devFWStatus"    # Ljava/lang/String;
    .param p12, "lastSeen"    # Ljava/lang/String;
    .param p13, "hide"    # I

    .prologue
    .line 191
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->type:Ljava/lang/String;

    .line 192
    iput-object p2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->friendlyName:Ljava/lang/String;

    .line 193
    iput-object p3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->icon:Ljava/lang/String;

    .line 194
    iget-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating DeviceInformation instance. icon: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    iput-object p3, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->iconURL:Ljava/lang/String;

    .line 196
    iput p4, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->state:I

    .line 198
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->attrList:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    :goto_0
    iput p6, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    .line 204
    iput-object p7, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->modelCode:Ljava/lang/String;

    .line 205
    iput-object p8, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->customizedState:Ljava/lang/String;

    .line 206
    iput-object p9, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 207
    iput-object p10, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->info:Ljava/lang/String;

    .line 208
    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->fwStatus:Ljava/lang/String;

    .line 209
    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->lastSeen:Ljava/lang/String;

    .line 210
    move/from16 v0, p13

    iput v0, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->hide:I

    .line 212
    iget v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->inActive:I

    if-nez v2, :cond_0

    .line 213
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    .line 216
    :goto_1
    return-void

    .line 199
    :catch_0
    move-exception v1

    .line 201
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 215
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/cache/data/DeviceInformation;->isDiscovered:Z

    goto :goto_1
.end method
