.class public Lcom/belkin/wemo/cache/devicelist/WeMoDevice;
.super Ljava/lang/Object;
.source "WeMoDevice.java"


# static fields
.field public static final AIR_PURIFIER:Ljava/lang/String;

.field public static final BRIDGE:Ljava/lang/String;

.field public static final COFFEE_MAKER:Ljava/lang/String;

.field public static final DEFAULT:Ljava/lang/String; = "urn:Belkin:device:socket:1"

.field public static final HEATER:Ljava/lang/String;

.field public static final HEATERA:Ljava/lang/String;

.field public static final HEATERB:Ljava/lang/String;

.field public static final HUMIDIFIER:Ljava/lang/String;

.field public static final HUMIDIFIERB:Ljava/lang/String;

.field public static final INSIGHT:Ljava/lang/String;

.field public static final LIGHT_SWITCH:Ljava/lang/String;

.field public static final LINK_CAM:Ljava/lang/String;

.field public static final MAKER:Ljava/lang/String;

.field public static final NET_CAM:Ljava/lang/String;

.field public static final SENSOR:Ljava/lang/String;

.field public static final SLOW_COOKER:Ljava/lang/String;

.field public static final SWITCH:Ljava/lang/String;

.field public static final WEMO_DEVICE_NOTIFY_TYPE:Ljava/lang/String; = "-1"

.field public static final WEMO_DEVICE_OFF:Ljava/lang/String; = "0"

.field public static final WEMO_DEVICE_ON:Ljava/lang/String; = "1"

.field public static final WEMO_DEVICE_STAND_BY:Ljava/lang/String; = "8"

.field public static final WEMO_DEVICE_UNDEFINED:Ljava/lang/String; = "-1"


# instance fields
.field private checkingStatus:Ljava/lang/String;

.field private endDiscoveryTime:J

.field private foundTime:Ljava/lang/String;

.field private idDB:I

.field private inActive:I

.field private info:Ljava/lang/String;

.field private isDiscovered:Z

.field private lastTimestamp:Ljava/lang/String;

.field private mAttributelist:Ljava/lang/String;

.field private mBlobStorage:Ljava/lang/String;

.field private mBrandName:Ljava/lang/String;

.field private mCountdown:Ljava/lang/String;

.field private mCustomizedState:Ljava/lang/String;

.field private mDevice:Lorg/cybergarage/upnp/Device;

.field private mDiscoveryState:Ljava/lang/String;

.field private mFWstatus:I

.field private mFirmwareVersion:Ljava/lang/String;

.field private mFriendlyName:Ljava/lang/String;

.field private mHwVersion:Ljava/lang/String;

.field private mIsAvailable:Z

.field private mLogo:Ljava/lang/String;

.field private mLogoURL:Ljava/lang/String;

.field private mModelName:Ljava/lang/String;

.field private mNotifyType:Ljava/lang/String;

.field private mProductName:Ljava/lang/String;

.field private mSerialNumber:Ljava/lang/String;

.field private mState:Ljava/lang/String;

.field private mType:Ljava/lang/String;

.field private mUDN:Ljava/lang/String;

.field private mac:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;

.field private startDiscoveryTime:J

.field private timestamp:Ljava/lang/String;

.field private whichDiscovered:Ljava/lang/String;

.field private whichFound:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "urn:Belkin:device:bridge:1"

    :goto_0
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->BRIDGE:Ljava/lang/String;

    .line 53
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "urn:Belkin:device:controllee:1"

    :goto_1
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->SWITCH:Ljava/lang/String;

    .line 57
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "urn:Belkin:device:sensor:1"

    :goto_2
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->SENSOR:Ljava/lang/String;

    .line 61
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "urn:Belkin:device:lightswitch:1"

    :goto_3
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->LIGHT_SWITCH:Ljava/lang/String;

    .line 65
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "urn:Belkin:device:insight:1"

    :goto_4
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->INSIGHT:Ljava/lang/String;

    .line 69
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "urn:Belkin:device:NetCamSensor:1"

    :goto_5
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->NET_CAM:Ljava/lang/String;

    .line 73
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "urn:Belkin:device:LinksysWNCSensor:1"

    :goto_6
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->LINK_CAM:Ljava/lang/String;

    .line 77
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "urn:Belkin:device:CoffeeMaker:1"

    :goto_7
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->COFFEE_MAKER:Ljava/lang/String;

    .line 81
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "urn:Belkin:device:Crockpot:1"

    :goto_8
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->SLOW_COOKER:Ljava/lang/String;

    .line 85
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "urn:Belkin:device:AirPurifier:1"

    :goto_9
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->AIR_PURIFIER:Ljava/lang/String;

    .line 89
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "urn:Belkin:device:Heater:1"

    :goto_a
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->HEATER:Ljava/lang/String;

    .line 93
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "urn:Belkin:device:HeaterA:1"

    :goto_b
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->HEATERA:Ljava/lang/String;

    .line 97
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "urn:Belkin:device:HeaterB:1"

    :goto_c
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->HEATERB:Ljava/lang/String;

    .line 101
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "urn:Belkin:device:Maker:1"

    :goto_d
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->MAKER:Ljava/lang/String;

    .line 105
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "urn:Belkin:device:Humidifier:1"

    :goto_e
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->HUMIDIFIER:Ljava/lang/String;

    .line 109
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_f

    const-string v0, "urn:Belkin:device:HumidifierB:1"

    :goto_f
    sput-object v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->HUMIDIFIERB:Ljava/lang/String;

    return-void

    .line 49
    :cond_0
    const-string v0, "LED"

    goto/16 :goto_0

    .line 53
    :cond_1
    const-string v0, "Socket"

    goto/16 :goto_1

    .line 57
    :cond_2
    const-string v0, "Sensor"

    goto/16 :goto_2

    .line 61
    :cond_3
    const-string v0, "Lightswitch"

    goto/16 :goto_3

    .line 65
    :cond_4
    const-string v0, "Insight"

    goto/16 :goto_4

    .line 69
    :cond_5
    const-string v0, "NetCam"

    goto :goto_5

    .line 73
    :cond_6
    const-string v0, "LinkCam"

    goto :goto_6

    .line 77
    :cond_7
    const-string v0, "CoffeeMaker"

    goto :goto_7

    .line 81
    :cond_8
    const-string v0, "Crockpot"

    goto :goto_8

    .line 85
    :cond_9
    const-string v0, "AirPurifier"

    goto :goto_9

    .line 89
    :cond_a
    const-string v0, "Heater"

    goto :goto_a

    .line 93
    :cond_b
    const-string v0, "HeaterA"

    goto :goto_b

    .line 97
    :cond_c
    const-string v0, "HeaterB"

    goto :goto_c

    .line 101
    :cond_d
    const-string v0, "Maker"

    goto :goto_d

    .line 105
    :cond_e
    const-string v0, "Humidifier"

    goto :goto_e

    .line 109
    :cond_f
    const-string v0, "HumidifierB"

    goto :goto_f
.end method

.method public constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 10
    .param p1, "devInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    const-wide/16 v8, 0x0

    const/16 v6, 0x3b

    const/16 v5, 0x2c

    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 207
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    const-string v1, "-1"

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mState:Ljava/lang/String;

    .line 122
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mAttributelist:Ljava/lang/String;

    .line 123
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mBlobStorage:Ljava/lang/String;

    .line 124
    const-string v1, "-1"

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mNotifyType:Ljava/lang/String;

    .line 125
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogoURL:Ljava/lang/String;

    .line 126
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogo:Ljava/lang/String;

    .line 127
    iput-boolean v4, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mIsAvailable:Z

    .line 128
    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    .line 129
    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    .line 130
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mType:Ljava/lang/String;

    .line 131
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    .line 132
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    .line 133
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mSerialNumber:Ljava/lang/String;

    .line 134
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mModelName:Ljava/lang/String;

    .line 135
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDiscoveryState:Ljava/lang/String;

    .line 136
    iput-wide v8, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->startDiscoveryTime:J

    .line 137
    iput-wide v8, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->endDiscoveryTime:J

    .line 138
    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mac:Ljava/lang/String;

    .line 139
    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->pluginID:Ljava/lang/String;

    .line 140
    iput v4, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->inActive:I

    .line 141
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichDiscovered:Ljava/lang/String;

    .line 143
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->foundTime:Ljava/lang/String;

    .line 144
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichFound:Ljava/lang/String;

    .line 145
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->timestamp:Ljava/lang/String;

    .line 146
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->lastTimestamp:Ljava/lang/String;

    .line 147
    iput v4, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFWstatus:I

    .line 149
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->info:Ljava/lang/String;

    .line 150
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mBrandName:Ljava/lang/String;

    .line 151
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mProductName:Ljava/lang/String;

    .line 152
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mHwVersion:Ljava/lang/String;

    .line 153
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCountdown:Ljava/lang/String;

    .line 154
    iput-boolean v4, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->isDiscovered:Z

    .line 208
    if-nez p1, :cond_0

    .line 209
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 211
    :cond_0
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    .line 212
    const-string v1, "WeMoDevice"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "constructor deviceinformation mUDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mType:Ljava/lang/String;

    .line 214
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    .line 215
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mSerialNumber:Ljava/lang/String;

    .line 216
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v1

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mIsAvailable:Z

    .line 217
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getHwVersion()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mHwVersion:Ljava/lang/String;

    .line 218
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mModelName:Ljava/lang/String;

    .line 221
    :try_start_0
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mState:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    :goto_0
    const-string v1, "Loaded from cache"

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDiscoveryState:Ljava/lang/String;

    .line 224
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInfo()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->info:Ljava/lang/String;

    .line 225
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mAttributelist:Ljava/lang/String;

    .line 226
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogoURL:Ljava/lang/String;

    .line 227
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    .line 228
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCustomizedState()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    .line 229
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mac:Ljava/lang/String;

    .line 230
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->pluginID:Ljava/lang/String;

    .line 231
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    .line 232
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    invoke-static {v1}, Lcom/belkin/wemo/cache/utils/IsDevice;->NetCam(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 233
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    .line 234
    .local v0, "deviceName":Ljava/lang/String;
    invoke-virtual {v0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-lez v1, :cond_3

    .line 235
    invoke-virtual {v0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 239
    :cond_1
    :goto_1
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    .line 242
    .end local v0    # "deviceName":Ljava/lang/String;
    :cond_2
    return-void

    .line 236
    .restart local v0    # "deviceName":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-lez v1, :cond_1

    .line 237
    invoke-virtual {v0, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 222
    .end local v0    # "deviceName":Ljava/lang/String;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method constructor <init>(Lorg/cybergarage/upnp/Device;)V
    .locals 6
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 197
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    const-string v0, "-1"

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mState:Ljava/lang/String;

    .line 122
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mAttributelist:Ljava/lang/String;

    .line 123
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mBlobStorage:Ljava/lang/String;

    .line 124
    const-string v0, "-1"

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mNotifyType:Ljava/lang/String;

    .line 125
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogoURL:Ljava/lang/String;

    .line 126
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogo:Ljava/lang/String;

    .line 127
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mIsAvailable:Z

    .line 128
    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    .line 129
    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    .line 130
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mType:Ljava/lang/String;

    .line 131
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    .line 132
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    .line 133
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mSerialNumber:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mModelName:Ljava/lang/String;

    .line 135
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDiscoveryState:Ljava/lang/String;

    .line 136
    iput-wide v4, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->startDiscoveryTime:J

    .line 137
    iput-wide v4, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->endDiscoveryTime:J

    .line 138
    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mac:Ljava/lang/String;

    .line 139
    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->pluginID:Ljava/lang/String;

    .line 140
    iput v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->inActive:I

    .line 141
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichDiscovered:Ljava/lang/String;

    .line 143
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->foundTime:Ljava/lang/String;

    .line 144
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichFound:Ljava/lang/String;

    .line 145
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->timestamp:Ljava/lang/String;

    .line 146
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->lastTimestamp:Ljava/lang/String;

    .line 147
    iput v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFWstatus:I

    .line 149
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->info:Ljava/lang/String;

    .line 150
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mBrandName:Ljava/lang/String;

    .line 151
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mProductName:Ljava/lang/String;

    .line 152
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mHwVersion:Ljava/lang/String;

    .line 153
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCountdown:Ljava/lang/String;

    .line 154
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->isDiscovered:Z

    .line 198
    if-nez p1, :cond_0

    .line 199
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 201
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 202
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setParametersFromDevice()V

    .line 203
    const-string v0, "WeMoDevice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "constructor device mUDN: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    return-void
.end method

.method private setParametersFromDevice()V
    .locals 2

    .prologue
    .line 245
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mType:Ljava/lang/String;

    .line 246
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    .line 247
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    .line 248
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getSerialNumber()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mSerialNumber:Ljava/lang/String;

    .line 249
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getModelName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mModelName:Ljava/lang/String;

    .line 250
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getMacAddress()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mac:Ljava/lang/String;

    .line 251
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getBrandName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mBrandName:Ljava/lang/String;

    .line 252
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/Device;->getAttributeListParameterFromDevice()Lorg/json/JSONObject;

    move-result-object v0

    .line 253
    .local v0, "attributeList":Lorg/json/JSONObject;
    if-eqz v0, :cond_0

    .line 254
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mAttributelist:Ljava/lang/String;

    .line 255
    :cond_0
    return-void
.end method


# virtual methods
.method public getAttributeList()Ljava/lang/String;
    .locals 1

    .prologue
    .line 311
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mAttributelist:Ljava/lang/String;

    return-object v0
.end method

.method public getBlobStorage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 317
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mBlobStorage:Ljava/lang/String;

    return-object v0
.end method

.method public getBrandName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 591
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mBrandName:Ljava/lang/String;

    return-object v0
.end method

.method public getCheckingStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 550
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->checkingStatus:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 551
    const-string v0, "First time discovered"

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->checkingStatus:Ljava/lang/String;

    .line 553
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->checkingStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getCountdownEndTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 651
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCountdown:Ljava/lang/String;

    return-object v0
.end method

.method public getCustomizedState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 430
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    return-object v0
.end method

.method public getDevice()Lorg/cybergarage/upnp/Device;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    return-object v0
.end method

.method public getDeviceIdDB()I
    .locals 1

    .prologue
    .line 457
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->idDB:I

    return v0
.end method

.method public getDiscoveryState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 489
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDiscoveryState:Ljava/lang/String;

    return-object v0
.end method

.method public getDiscoveryTime()J
    .locals 4

    .prologue
    .line 561
    iget-wide v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->endDiscoveryTime:J

    iget-wide v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->startDiscoveryTime:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public getDiscoveryTimeString()Ljava/lang/String;
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 565
    iget-wide v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->startDiscoveryTime:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    iget-wide v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->endDiscoveryTime:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    iget-wide v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->endDiscoveryTime:J

    iget-wide v4, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->startDiscoveryTime:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    .line 566
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDiscoveryTime()J

    move-result-wide v2

    long-to-int v2, v2

    div-int/lit16 v1, v2, 0x3e8

    .line 567
    .local v1, "speed":I
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDiscoveryTime()J

    move-result-wide v2

    long-to-int v2, v2

    rem-int/lit16 v2, v2, 0x3e8

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 568
    .local v0, "ms":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    if-le v2, v3, :cond_0

    .line 569
    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 570
    :cond_0
    if-lez v1, :cond_1

    .line 571
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

    .line 575
    .end local v0    # "ms":Ljava/lang/String;
    .end local v1    # "speed":I
    :goto_0
    return-object v2

    .line 573
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

    .line 575
    .end local v0    # "ms":Ljava/lang/String;
    .end local v1    # "speed":I
    :cond_2
    const-string v2, ""

    goto :goto_0
.end method

.method public getEndDiscoveryTime()J
    .locals 2

    .prologue
    .line 526
    iget-wide v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->endDiscoveryTime:J

    return-wide v0
.end method

.method public getFWstatus()I
    .locals 1

    .prologue
    .line 193
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFWstatus:I

    return v0
.end method

.method public getFirmwareVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 415
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getFoundTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 510
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->foundTime:Ljava/lang/String;

    return-object v0
.end method

.method public getFriendlyName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 276
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    return-object v0
.end method

.method public getHwVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 627
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mHwVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getInActive()I
    .locals 1

    .prologue
    .line 534
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->inActive:I

    return v0
.end method

.method public getInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->info:Ljava/lang/String;

    return-object v0
.end method

.method public getIsDiscovered()Z
    .locals 1

    .prologue
    .line 616
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->isDiscovered:Z

    return v0
.end method

.method public getLastTimestamp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->lastTimestamp:Ljava/lang/String;

    return-object v0
.end method

.method public getLogo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 338
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogo:Ljava/lang/String;

    return-object v0
.end method

.method public getLogoURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 331
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogoURL:Ljava/lang/String;

    return-object v0
.end method

.method public getMac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mac:Ljava/lang/String;

    return-object v0
.end method

.method public getModelName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 297
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mModelName:Ljava/lang/String;

    return-object v0
.end method

.method public getNotifyType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 324
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mNotifyType:Ljava/lang/String;

    return-object v0
.end method

.method public getPluginID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->pluginID:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 605
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mProductName:Ljava/lang/String;

    return-object v0
.end method

.method public getSerialNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 290
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mSerialNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getStartDiscoveryTime()J
    .locals 2

    .prologue
    .line 522
    iget-wide v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->startDiscoveryTime:J

    return-wide v0
.end method

.method public getState()Ljava/lang/String;
    .locals 2

    .prologue
    .line 304
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mState:Ljava/lang/String;

    const-string v1, "\\|."

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getTimestamp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 584
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->timestamp:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mType:Ljava/lang/String;

    return-object v0
.end method

.method public getUDN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 283
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    return-object v0
.end method

.method public getWhichDiscovered()Ljava/lang/String;
    .locals 1

    .prologue
    .line 542
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichDiscovered:Ljava/lang/String;

    return-object v0
.end method

.method public getWhichFound()Ljava/lang/String;
    .locals 1

    .prologue
    .line 502
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichFound:Ljava/lang/String;

    return-object v0
.end method

.method public isAvailable()Z
    .locals 1

    .prologue
    .line 258
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->inActive:I

    if-nez v0, :cond_0

    .line 259
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mIsAvailable:Z

    .line 262
    :goto_0
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mIsAvailable:Z

    return v0

    .line 261
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mIsAvailable:Z

    goto :goto_0
.end method

.method public setAttributeList(Ljava/lang/String;)V
    .locals 0
    .param p1, "attributelist"    # Ljava/lang/String;

    .prologue
    .line 372
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mAttributelist:Ljava/lang/String;

    .line 373
    return-void
.end method

.method setAvailability(Z)V
    .locals 0
    .param p1, "availability"    # Z

    .prologue
    .line 342
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mIsAvailable:Z

    .line 343
    return-void
.end method

.method setBlobStorage(Ljava/lang/String;)V
    .locals 0
    .param p1, "blobStorage"    # Ljava/lang/String;

    .prologue
    .line 382
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mBlobStorage:Ljava/lang/String;

    .line 383
    return-void
.end method

.method public setBrandName(Ljava/lang/String;)V
    .locals 0
    .param p1, "mBrandName"    # Ljava/lang/String;

    .prologue
    .line 598
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mBrandName:Ljava/lang/String;

    .line 599
    return-void
.end method

.method public setCheckingStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "checkingStatus"    # Ljava/lang/String;

    .prologue
    .line 557
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->checkingStatus:Ljava/lang/String;

    .line 558
    return-void
.end method

.method public setCountdownEndTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "mCountdown"    # Ljava/lang/String;

    .prologue
    .line 644
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCountdown:Ljava/lang/String;

    .line 645
    return-void
.end method

.method setCustomizedState(Ljava/lang/String;)V
    .locals 0
    .param p1, "customizedState"    # Ljava/lang/String;

    .prologue
    .line 423
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    .line 424
    return-void
.end method

.method public setDevice(Lorg/cybergarage/upnp/Device;)V
    .locals 3
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 444
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 452
    :cond_0
    :goto_0
    return-void

    .line 446
    :cond_1
    const-string v0, "WeMoDevice"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDevice device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " location: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " udn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " len: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 447
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getLocation()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 449
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 450
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setParametersFromDevice()V

    goto :goto_0
.end method

.method public setDeviceIdDB(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 465
    iput p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->idDB:I

    .line 466
    return-void
.end method

.method public setDiscoveryState(Ljava/lang/String;)V
    .locals 1
    .param p1, "discoveryState"    # Ljava/lang/String;

    .prologue
    .line 493
    const-string v0, "Discovery Success"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Loaded from cloud"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    if-eqz p1, :cond_1

    const-string v0, "Loaded from cache"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 495
    :cond_1
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDiscoveryTimeString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->foundTime:Ljava/lang/String;

    .line 496
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichDiscovered:Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichFound:Ljava/lang/String;

    .line 498
    :cond_2
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mDiscoveryState:Ljava/lang/String;

    .line 499
    return-void
.end method

.method public setEndDiscoveryTime(J)V
    .locals 1
    .param p1, "time"    # J

    .prologue
    .line 530
    iput-wide p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->endDiscoveryTime:J

    .line 531
    return-void
.end method

.method public setFWstatus(I)V
    .locals 0
    .param p1, "fwStatus"    # I

    .prologue
    .line 189
    iput p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFWstatus:I

    .line 190
    return-void
.end method

.method setFirmwareVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "firmwareVersion"    # Ljava/lang/String;

    .prologue
    .line 408
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    .line 409
    return-void
.end method

.method public setFoundTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "foundTime"    # Ljava/lang/String;

    .prologue
    .line 514
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->foundTime:Ljava/lang/String;

    .line 515
    return-void
.end method

.method public setFriendlyName(Ljava/lang/String;)V
    .locals 0
    .param p1, "friendlyName"    # Ljava/lang/String;

    .prologue
    .line 473
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    .line 474
    return-void
.end method

.method public setHwVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "hwVersion"    # Ljava/lang/String;

    .prologue
    .line 635
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mHwVersion:Ljava/lang/String;

    .line 636
    return-void
.end method

.method public setInActive(I)V
    .locals 0
    .param p1, "inActive"    # I

    .prologue
    .line 538
    iput p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->inActive:I

    .line 539
    return-void
.end method

.method public setInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "info"    # Ljava/lang/String;

    .prologue
    .line 169
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->info:Ljava/lang/String;

    .line 170
    return-void
.end method

.method public setIsDiscovered(Z)V
    .locals 0
    .param p1, "isDiscovered"    # Z

    .prologue
    .line 620
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->isDiscovered:Z

    .line 621
    return-void
.end method

.method public setLastTimestamp(Ljava/lang/String;)V
    .locals 0
    .param p1, "lastTimestamp"    # Ljava/lang/String;

    .prologue
    .line 161
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->lastTimestamp:Ljava/lang/String;

    .line 162
    return-void
.end method

.method setLogo(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 400
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogo:Ljava/lang/String;

    .line 401
    return-void
.end method

.method public setLogoURL(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 391
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogoURL:Ljava/lang/String;

    .line 392
    return-void
.end method

.method public setMac(Ljava/lang/String;)V
    .locals 0
    .param p1, "mac"    # Ljava/lang/String;

    .prologue
    .line 185
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mac:Ljava/lang/String;

    .line 186
    return-void
.end method

.method public setModelName(Ljava/lang/String;)V
    .locals 0
    .param p1, "modelName"    # Ljava/lang/String;

    .prologue
    .line 485
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mModelName:Ljava/lang/String;

    .line 486
    return-void
.end method

.method setNotifyType(Ljava/lang/String;)V
    .locals 0
    .param p1, "varName"    # Ljava/lang/String;

    .prologue
    .line 362
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mNotifyType:Ljava/lang/String;

    .line 363
    return-void
.end method

.method public setPluginID(Ljava/lang/String;)V
    .locals 0
    .param p1, "pluginID"    # Ljava/lang/String;

    .prologue
    .line 177
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->pluginID:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public setProductName(Ljava/lang/String;)V
    .locals 0
    .param p1, "productName"    # Ljava/lang/String;

    .prologue
    .line 612
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mProductName:Ljava/lang/String;

    .line 613
    return-void
.end method

.method public setSerialNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "serialNumber"    # Ljava/lang/String;

    .prologue
    .line 481
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mSerialNumber:Ljava/lang/String;

    .line 482
    return-void
.end method

.method public setStartDiscoveryTime(J)V
    .locals 1
    .param p1, "time"    # J

    .prologue
    .line 518
    iput-wide p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->startDiscoveryTime:J

    .line 519
    return-void
.end method

.method setState(Ljava/lang/String;)V
    .locals 0
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 352
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mState:Ljava/lang/String;

    .line 353
    return-void
.end method

.method public setTimestamp()V
    .locals 2

    .prologue
    .line 579
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "MM/dd/yyyy HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 580
    .local v0, "sdf":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->timestamp:Ljava/lang/String;

    .line 581
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 469
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mType:Ljava/lang/String;

    .line 470
    return-void
.end method

.method public setUDN(Ljava/lang/String;)V
    .locals 0
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 477
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    .line 478
    return-void
.end method

.method public setWhichDiscovered(Ljava/lang/String;)V
    .locals 0
    .param p1, "whichDiscovered"    # Ljava/lang/String;

    .prologue
    .line 546
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichDiscovered:Ljava/lang/String;

    .line 547
    return-void
.end method

.method public setWhichFound(Ljava/lang/String;)V
    .locals 0
    .param p1, "whichFound"    # Ljava/lang/String;

    .prologue
    .line 506
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->whichFound:Ljava/lang/String;

    .line 507
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 656
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "udn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mUDN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFriendlyName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "icon: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mLogo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "maker: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mAttributelist:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "inActive: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->inActive:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "modelName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mModelName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "customized: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "fwVersion: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "info: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->info:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "mIsAvailable: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mIsAvailable:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "fwStatus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mFWstatus:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "mac: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->mac:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "pluginID"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 665
    .local v0, "str":Ljava/lang/String;
    return-object v0
.end method
