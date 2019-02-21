.class public Lcom/belkin/wemo/localsdk/WeMoDevice;
.super Ljava/lang/Object;
.source "WeMoDevice.java"


# static fields
.field public static final AIR_PURIFIER:Ljava/lang/String; = "urn:Belkin:device:AirPurifier:1"

.field public static final DEFAULT:Ljava/lang/String; = "urn:Belkin:device:socket:1"

.field public static final HEATERA:Ljava/lang/String; = "urn:Belkin:device:HeaterA:1"

.field public static final HEATERB:Ljava/lang/String; = "urn:Belkin:device:HeaterB:1"

.field public static final HUMIDIFIER:Ljava/lang/String; = "urn:Belkin:device:Humidifier:1"

.field public static final HUMIDIFIERB:Ljava/lang/String; = "urn:Belkin:device:HumidifierB:1"

.field public static final INSIGHT:Ljava/lang/String; = "urn:Belkin:device:insight:1"

.field public static final LIGHT_SWITCH:Ljava/lang/String; = "urn:Belkin:device:lightswitch:1"

.field public static final LINK_CAM:Ljava/lang/String; = "urn:Belkin:device:LinksysWNCSensor:1"

.field public static final MAKER:Ljava/lang/String; = "urn:Belkin:device:Maker:1"

.field public static final NET_CAM:Ljava/lang/String; = "urn:Belkin:device:NetCamSensor:1"

.field public static final SENSOR:Ljava/lang/String; = "urn:Belkin:device:sensor:1"

.field public static final SWITCH:Ljava/lang/String; = "urn:Belkin:device:controllee:1"

.field public static final WEMO_DEVICE_NOTIFY_TYPE:Ljava/lang/String; = "-1"

.field public static final WEMO_DEVICE_OFF:Ljava/lang/String; = "0"

.field public static final WEMO_DEVICE_ON:Ljava/lang/String; = "1"

.field public static final WEMO_DEVICE_STAND_BY:Ljava/lang/String; = "8"

.field public static final WEMO_DEVICE_UNDEFINED:Ljava/lang/String; = "-1"


# instance fields
.field private mAttributelist:Ljava/lang/String;

.field private mBlobStorage:Ljava/lang/String;

.field private mCountdown:Ljava/lang/String;

.field private mCustomizedState:Ljava/lang/String;

.field private mDevice:Lorg/cybergarage/upnp/Device;

.field private mFirmwareVersion:Ljava/lang/String;

.field private mHwVersion:Ljava/lang/String;

.field private mIsAvailable:Z

.field private mIsSubscribed:Z

.field private mLogo:Ljava/lang/String;

.field private mLogoURL:Ljava/lang/String;

.field private mMacAddress:Ljava/lang/String;

.field private mNotifyType:Ljava/lang/String;

.field private mProductName:Ljava/lang/String;

.field private mState:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    const-string v0, "-1"

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mState:Ljava/lang/String;

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mCountdown:Ljava/lang/String;

    .line 107
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mMacAddress:Ljava/lang/String;

    .line 113
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mAttributelist:Ljava/lang/String;

    .line 118
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mBlobStorage:Ljava/lang/String;

    .line 123
    const-string v0, "-1"

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mNotifyType:Ljava/lang/String;

    .line 129
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mLogoURL:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mLogo:Ljava/lang/String;

    .line 136
    iput-boolean v1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mIsAvailable:Z

    .line 137
    iput-boolean v1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mIsSubscribed:Z

    .line 138
    iput-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    .line 139
    iput-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    .line 144
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mHwVersion:Ljava/lang/String;

    .line 149
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mProductName:Ljava/lang/String;

    .line 155
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method constructor <init>(Lorg/cybergarage/upnp/Device;)V
    .locals 3
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    const-string v0, "-1"

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mState:Ljava/lang/String;

    .line 102
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mCountdown:Ljava/lang/String;

    .line 107
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mMacAddress:Ljava/lang/String;

    .line 113
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mAttributelist:Ljava/lang/String;

    .line 118
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mBlobStorage:Ljava/lang/String;

    .line 123
    const-string v0, "-1"

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mNotifyType:Ljava/lang/String;

    .line 129
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mLogoURL:Ljava/lang/String;

    .line 134
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mLogo:Ljava/lang/String;

    .line 136
    iput-boolean v1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mIsAvailable:Z

    .line 137
    iput-boolean v1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mIsSubscribed:Z

    .line 138
    iput-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    .line 139
    iput-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    .line 144
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mHwVersion:Ljava/lang/String;

    .line 149
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mProductName:Ljava/lang/String;

    .line 159
    if-nez p1, :cond_0

    .line 160
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 162
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    .line 163
    return-void
.end method

.method public static isValid(Ljava/lang/String;)Z
    .locals 1
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 451
    const-string v0, "Controlee"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Socket"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Sensor"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Lightswitch"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "NetCamSensor"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "LinksysWNCSensor"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Insight"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Bridge"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Coffee"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Crockpot"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Maker"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Heater"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Purifier"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Humidifier"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 454
    :cond_0
    const/4 v0, 0x1

    .line 456
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getAttribute()Ljava/lang/String;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mAttributelist:Ljava/lang/String;

    return-object v0
.end method

.method public getBlobStorage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mBlobStorage:Ljava/lang/String;

    return-object v0
.end method

.method public getBrandName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getBrandName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCountdownEndTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 355
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mCountdown:Ljava/lang/String;

    return-object v0
.end method

.method public getCustomizedState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 388
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    return-object v0
.end method

.method public getDevice()Lorg/cybergarage/upnp/Device;
    .locals 1

    .prologue
    .line 404
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    return-object v0
.end method

.method public getDeviceInformation()Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 15

    .prologue
    const/4 v7, 0x0

    .line 438
    new-instance v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {p0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getFriendlyName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getState()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const-string v6, ""

    invoke-virtual {p0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getModelName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getCustomizedState()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v10

    const-string v11, ""

    const-string v12, "0"

    const-string v13, "0"

    move v14, v7

    invoke-direct/range {v0 .. v14}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 442
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    return-object v0
.end method

.method public getFirmwareVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getFriendlyName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHwVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 411
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mHwVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getLogo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mLogo:Ljava/lang/String;

    return-object v0
.end method

.method public getLogoURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mLogoURL:Ljava/lang/String;

    return-object v0
.end method

.method public getMacAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 362
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mMacAddress:Ljava/lang/String;

    return-object v0
.end method

.method public getModelName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getModelName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNotifyType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mNotifyType:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 426
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mProductName:Ljava/lang/String;

    return-object v0
.end method

.method public getSerialNumber()Ljava/lang/String;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getSerialNumber()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mState:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUDN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isAvailable()Z
    .locals 1

    .prologue
    .line 168
    iget-boolean v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mIsAvailable:Z

    return v0
.end method

.method public isSubscribed()Z
    .locals 1

    .prologue
    .line 174
    iget-boolean v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mIsSubscribed:Z

    return v0
.end method

.method setAttribute(Ljava/lang/String;)V
    .locals 0
    .param p1, "attributelist"    # Ljava/lang/String;

    .prologue
    .line 296
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mAttributelist:Ljava/lang/String;

    .line 297
    return-void
.end method

.method setAvailability(Z)V
    .locals 1
    .param p1, "availability"    # Z

    .prologue
    .line 260
    iput-boolean p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mIsAvailable:Z

    .line 261
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->setAvailable(Z)V

    .line 262
    return-void
.end method

.method setBlobStrage(Ljava/lang/String;)V
    .locals 0
    .param p1, "blobStorage"    # Ljava/lang/String;

    .prologue
    .line 306
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mBlobStorage:Ljava/lang/String;

    .line 307
    return-void
.end method

.method public setBrandName(Ljava/lang/String;)V
    .locals 1
    .param p1, "brandName"    # Ljava/lang/String;

    .prologue
    .line 397
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mDevice:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Device;->setBrandName(Ljava/lang/String;)V

    .line 398
    return-void
.end method

.method public setCountdownEndTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "mCountdown"    # Ljava/lang/String;

    .prologue
    .line 348
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mCountdown:Ljava/lang/String;

    .line 349
    return-void
.end method

.method setCustomizedState(Ljava/lang/String;)V
    .locals 0
    .param p1, "customizedState"    # Ljava/lang/String;

    .prologue
    .line 381
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mCustomizedState:Ljava/lang/String;

    .line 382
    return-void
.end method

.method setFirmwareVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "firmwareVersion"    # Ljava/lang/String;

    .prologue
    .line 332
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mFirmwareVersion:Ljava/lang/String;

    .line 333
    return-void
.end method

.method public setHwVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "hwVersion"    # Ljava/lang/String;

    .prologue
    .line 419
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mHwVersion:Ljava/lang/String;

    .line 420
    return-void
.end method

.method setLogo(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 324
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mLogo:Ljava/lang/String;

    .line 325
    return-void
.end method

.method setLogoURL(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 315
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mLogoURL:Ljava/lang/String;

    .line 316
    return-void
.end method

.method public setMacAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "mMacAddress"    # Ljava/lang/String;

    .prologue
    .line 371
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mMacAddress:Ljava/lang/String;

    .line 372
    return-void
.end method

.method setNotifyType(Ljava/lang/String;)V
    .locals 0
    .param p1, "varName"    # Ljava/lang/String;

    .prologue
    .line 286
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mNotifyType:Ljava/lang/String;

    .line 287
    return-void
.end method

.method public setProductName(Ljava/lang/String;)V
    .locals 0
    .param p1, "productName"    # Ljava/lang/String;

    .prologue
    .line 433
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mProductName:Ljava/lang/String;

    .line 434
    return-void
.end method

.method setState(Ljava/lang/String;)V
    .locals 0
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 276
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mState:Ljava/lang/String;

    .line 277
    return-void
.end method

.method setSubscribed(Z)V
    .locals 0
    .param p1, "subscribed"    # Z

    .prologue
    .line 267
    iput-boolean p1, p0, Lcom/belkin/wemo/localsdk/WeMoDevice;->mIsSubscribed:Z

    .line 268
    return-void
.end method
