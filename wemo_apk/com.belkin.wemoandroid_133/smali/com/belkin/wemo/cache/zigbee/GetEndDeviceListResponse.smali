.class public Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "GetEndDeviceListResponse.java"


# static fields
.field private static deviceListTyp:Ljava/lang/String;


# instance fields
.field private capabilityId:Z

.field private capabilityValue:Z

.field private currentState:Z

.field device:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private deviceId:Z

.field private deviceIdAvailablity:Ljava/lang/String;

.field private deviceIndex:Z

.field private deviceInfo:Z

.field private deviceInfos:Z

.field private deviceListType:Z

.field private deviceTypeBelkin:Ljava/lang/String;

.field private deviceTypeOSRAM:Ljava/lang/String;

.field private firmwareVersion:Z

.field private friendlyName:Z

.field private groupCapabilityId:Z

.field private groupCapabilityValues:Z

.field private groupId:Z

.field private groupInfo:Z

.field private groupName:Z

.field groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private iconVersion:Z

.field private isGroupAction:Z

.field private lastEventTimeStamp:Z

.field private manufacturerName:Z

.field private modelCode:Z

.field private processValue:Z

.field private productName:Z

.field private productType:Z

.field private responseBuffer:Ljava/lang/StringBuffer;

.field private rtmFW:Z

.field private tempVal:Ljava/lang/String;

.field private wemoCertified:Z

.field zigBeeDevice:Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;

.field private zigBeeDeviceList:Ljava/util/HashMap;
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

.field private zigBeeDevices:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;",
            ">;"
        }
    .end annotation
.end field

.field zigBeeGroupInfo:Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 26
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 33
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->processValue:Z

    .line 34
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->friendlyName:Z

    .line 35
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceId:Z

    .line 36
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceIndex:Z

    .line 37
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->iconVersion:Z

    .line 38
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->firmwareVersion:Z

    .line 39
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityId:Z

    .line 40
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->currentState:Z

    .line 41
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListType:Z

    .line 42
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->rtmFW:Z

    .line 43
    const-string v0, "Lightbulb"

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceTypeBelkin:Ljava/lang/String;

    .line 44
    const-string v0, "OSRAM"

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceTypeOSRAM:Ljava/lang/String;

    .line 47
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceInfo:Z

    .line 51
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceInfos:Z

    .line 54
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupInfo:Z

    .line 55
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupId:Z

    .line 56
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupName:Z

    .line 57
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupCapabilityId:Z

    .line 58
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupCapabilityValues:Z

    .line 59
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->modelCode:Z

    .line 60
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productName:Z

    .line 61
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productType:Z

    .line 62
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->manufacturerName:Z

    .line 63
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->wemoCertified:Z

    .line 68
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityValue:Z

    .line 69
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->lastEventTimeStamp:Z

    .line 70
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->isGroupAction:Z

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 6
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 295
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->characters([CII)V

    .line 296
    const-string v2, " "

    .line 297
    .local v2, "replaceString":Ljava/lang/String;
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->processValue:Z

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 298
    const/4 v3, 0x0

    aget-char v3, p1, v3

    const/16 v4, 0xa

    if-eq v3, v4, :cond_1

    .line 299
    new-instance v2, Ljava/lang/String;

    .end local v2    # "replaceString":Ljava/lang/String;
    invoke-direct {v2, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 300
    .restart local v2    # "replaceString":Ljava/lang/String;
    const-string v3, "available="

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 301
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 302
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 305
    :cond_1
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    iput-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    .line 307
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceIdAvailablity:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceIdAvailablity:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 308
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceIdAvailablity:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDeviceIdAvailablity(Ljava/lang/String;)V

    .line 311
    :cond_2
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupInfo:Z

    if-eqz v3, :cond_18

    .line 312
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceIndex:Z

    if-eqz v3, :cond_3

    .line 313
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDeviceIndex(Ljava/lang/String;)V

    .line 315
    :cond_3
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListType:Z

    if-eqz v3, :cond_4

    .line 316
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDeviceListType(Ljava/lang/String;)V

    .line 317
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    sput-object v3, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    .line 319
    :cond_4
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productType:Z

    if-eqz v3, :cond_5

    .line 320
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 322
    :cond_5
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productName:Z

    if-eqz v3, :cond_6

    .line 323
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 325
    :cond_6
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceId:Z

    if-eqz v3, :cond_7

    .line 326
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDeviceId(Ljava/lang/String;)V

    .line 327
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setUDN(Ljava/lang/String;)V

    .line 328
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setMAC(Ljava/lang/String;)V

    .line 330
    :cond_7
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->friendlyName:Z

    if-eqz v3, :cond_8

    .line 331
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 333
    :cond_8
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->iconVersion:Z

    if-eqz v3, :cond_9

    .line 334
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 336
    :cond_9
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->firmwareVersion:Z

    if-eqz v3, :cond_a

    .line 337
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFirmwareVersion(Ljava/lang/String;)V

    .line 339
    :cond_a
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityId:Z

    if-eqz v3, :cond_b

    .line 340
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilityID(Ljava/lang/String;)V

    .line 344
    :cond_b
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityValue:Z

    if-eqz v3, :cond_c

    .line 345
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilityvalue(Ljava/lang/String;)V

    .line 347
    :cond_c
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->lastEventTimeStamp:Z

    if-eqz v3, :cond_d

    .line 348
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setLastEventTimeStamp(I)V

    .line 350
    :cond_d
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->isGroupAction:Z

    if-eqz v3, :cond_e

    .line 351
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsGroupAction(Ljava/lang/String;)V

    .line 356
    :cond_e
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->currentState:Z

    if-nez v3, :cond_f

    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityValue:Z

    if-eqz v3, :cond_10

    .line 357
    :cond_f
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCurrentState(Ljava/lang/String;)V

    .line 358
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v4, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDeviceListType(Ljava/lang/String;)V

    .line 359
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 360
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 361
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_10

    .line 362
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->addLEDInGrp(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 366
    :cond_10
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->manufacturerName:Z

    if-eqz v3, :cond_11

    .line 367
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setManufacturerName(Ljava/lang/String;)V

    .line 369
    :cond_11
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->modelCode:Z

    if-eqz v3, :cond_12

    .line 370
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setModelCode(Ljava/lang/String;)V

    .line 372
    :cond_12
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->wemoCertified:Z

    if-eqz v3, :cond_13

    .line 373
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getManufacturerName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 376
    .local v1, "icon":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setWemoCertified(Ljava/lang/String;)V

    .line 378
    .end local v1    # "icon":Ljava/lang/String;
    :cond_13
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupId:Z

    if-eqz v3, :cond_14

    .line 379
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupID(Ljava/lang/String;)V

    .line 381
    :cond_14
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupName:Z

    if-eqz v3, :cond_15

    .line 382
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupName(Ljava/lang/String;)V

    .line 384
    :cond_15
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupCapabilityId:Z

    if-eqz v3, :cond_16

    .line 385
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupCapabilityID(Ljava/lang/String;)V

    .line 387
    :cond_16
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupCapabilityValues:Z

    if-eqz v3, :cond_17

    .line 388
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupCapabilities(Ljava/lang/String;)V

    .line 504
    :cond_17
    :goto_0
    return-void

    .line 392
    :cond_18
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceIndex:Z

    if-eqz v3, :cond_19

    .line 393
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDeviceIndex(Ljava/lang/String;)V

    .line 395
    :cond_19
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListType:Z

    if-eqz v3, :cond_1a

    .line 396
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    sput-object v3, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    .line 398
    :cond_1a
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productType:Z

    if-eqz v3, :cond_1b

    .line 399
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 401
    :cond_1b
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productName:Z

    if-eqz v3, :cond_1c

    .line 402
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 404
    :cond_1c
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceId:Z

    if-eqz v3, :cond_1d

    .line 405
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDeviceId(Ljava/lang/String;)V

    .line 406
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setUDN(Ljava/lang/String;)V

    .line 407
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setMAC(Ljava/lang/String;)V

    .line 409
    :cond_1d
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->iconVersion:Z

    if-eqz v3, :cond_1e

    .line 410
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 412
    :cond_1e
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->firmwareVersion:Z

    if-eqz v3, :cond_1f

    .line 413
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFirmwareVersion(Ljava/lang/String;)V

    .line 415
    :cond_1f
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityId:Z

    if-eqz v3, :cond_20

    .line 416
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilityID(Ljava/lang/String;)V

    .line 419
    :cond_20
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityValue:Z

    if-eqz v3, :cond_21

    .line 420
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilityvalue(Ljava/lang/String;)V

    .line 422
    :cond_21
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->lastEventTimeStamp:Z

    if-eqz v3, :cond_22

    .line 423
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setLastEventTimeStamp(I)V

    .line 424
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStatusTS(I)V

    .line 426
    :cond_22
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->isGroupAction:Z

    if-eqz v3, :cond_23

    .line 427
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsGroupAction(Ljava/lang/String;)V

    .line 432
    :cond_23
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->manufacturerName:Z

    if-eqz v3, :cond_24

    .line 433
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setManufacturerName(Ljava/lang/String;)V

    .line 435
    :cond_24
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->modelCode:Z

    if-eqz v3, :cond_25

    .line 436
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setModelCode(Ljava/lang/String;)V

    .line 438
    :cond_25
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->wemoCertified:Z

    if-eqz v3, :cond_28

    .line 439
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setWemoCertified(Ljava/lang/String;)V

    .line 441
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v4, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDeviceListType(Ljava/lang/String;)V

    .line 442
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 443
    const-string v3, "ZigbeeScan"

    const-string v4, "ProductType is empty "

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v3, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 448
    :goto_1
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_26

    .line 449
    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v3, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 452
    :cond_26
    const-string v3, "DeviceListController"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "adding device: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    if-nez v3, :cond_27

    .line 455
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    .line 456
    :cond_27
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->rtmFW:Z

    if-nez v3, :cond_28

    .line 457
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_28

    .line 458
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    :cond_28
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->currentState:Z

    if-nez v3, :cond_29

    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityValue:Z

    if-eqz v3, :cond_2e

    .line 463
    :cond_29
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCurrentState(Ljava/lang/String;)V

    .line 464
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->rtmFW:Z

    if-eqz v3, :cond_2e

    .line 465
    const-string v3, "ZigbeeScan"

    const-string v4, "it is RTM fw"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceTypeBelkin:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 467
    const-string v3, "ZigbeeScan"

    const-string v4, "device type belkin"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v4, "MZ100"

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setModelCode(Ljava/lang/String;)V

    .line 469
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v4, "MRVL"

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setManufacturerName(Ljava/lang/String;)V

    .line 470
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v4, "YES"

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setWemoCertified(Ljava/lang/String;)V

    .line 477
    :cond_2a
    :goto_2
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 478
    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v3, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 480
    :cond_2b
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 481
    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v3, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 485
    :cond_2c
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    if-nez v3, :cond_2d

    .line 486
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    .line 487
    :cond_2d
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2e

    .line 488
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    :cond_2e
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->friendlyName:Z

    if-eqz v3, :cond_17

    .line 494
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->tempVal:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 495
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v4, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListTyp:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDeviceListType(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 499
    :catch_0
    move-exception v0

    .line 501
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 446
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2f
    :try_start_1
    const-string v3, "ZigbeeScan"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ProductType is  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 471
    :cond_30
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceTypeOSRAM:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 472
    const-string v3, "ZigbeeScan"

    const-string v4, "device type OSRAM"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v4, "iQBR30"

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setModelCode(Ljava/lang/String;)V

    .line 474
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v4, "OSRAM SYLVANIA"

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setManufacturerName(Ljava/lang/String;)V

    .line 475
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v4, "NO"

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setWemoCertified(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 508
    invoke-super {p0, p1, p2, p3}, Lorg/xml/sax/helpers/DefaultHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    const-string v0, "DeviceInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 510
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceInfo:Z

    .line 512
    :cond_0
    const-string v0, "DeviceInfos"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 513
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceInfos:Z

    .line 515
    :cond_1
    const-string v0, "DeviceListType"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 516
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListType:Z

    .line 517
    :cond_2
    const-string v0, "DeviceIndex"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 518
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceIndex:Z

    .line 519
    :cond_3
    const-string v0, "DeviceID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 520
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceId:Z

    .line 521
    :cond_4
    const-string v0, "FriendlyName"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 522
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->friendlyName:Z

    .line 523
    :cond_5
    const-string v0, "IconVersion"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 524
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->iconVersion:Z

    .line 525
    :cond_6
    const-string v0, "FirmwareVersion"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 526
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->firmwareVersion:Z

    .line 527
    :cond_7
    const-string v0, "CapabilityIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 528
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityId:Z

    .line 530
    :cond_8
    const-string v0, "CapabilityValue"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 531
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityValue:Z

    .line 532
    :cond_9
    const-string v0, "LastEventTimeStamp"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 533
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->lastEventTimeStamp:Z

    .line 535
    :cond_a
    const-string v0, "IsGroupAction"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 536
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->isGroupAction:Z

    .line 541
    :cond_b
    const-string v0, "CurrentState"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 542
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->currentState:Z

    .line 544
    :cond_c
    const-string v0, "Manufacturer"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 545
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->manufacturerName:Z

    .line 547
    :cond_d
    const-string v0, "ModelCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 548
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->modelCode:Z

    .line 550
    :cond_e
    const-string v0, "productName"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 551
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productName:Z

    .line 553
    :cond_f
    const-string v0, "productType"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 554
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productType:Z

    .line 556
    :cond_10
    const-string v0, "WeMoCertified"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 557
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->wemoCertified:Z

    .line 559
    :cond_11
    const-string v0, "GroupInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 561
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    if-eqz v0, :cond_12

    .line 562
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 563
    iget-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    :cond_12
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupInfo:Z

    .line 570
    :cond_13
    const-string v0, "GroupID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 571
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupId:Z

    .line 573
    :cond_14
    const-string v0, "GroupName"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 574
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupName:Z

    .line 576
    :cond_15
    const-string v0, "GroupCapabilityIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 577
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupCapabilityId:Z

    .line 579
    :cond_16
    const-string v0, "GroupCapabilityValues"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 580
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupCapabilityValues:Z

    .line 583
    :cond_17
    return-void
.end method

.method public parseForGetEndDeviceList(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 5
    .param p1, "response"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    const-string v2, "ZigbeeScan"

    const-string v3, "in parseForGetEndDeviceList:"

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    new-instance v2, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDevice:Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;

    .line 89
    new-instance v2, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeGroupInfo:Lcom/belkin/wemo/cache/zigbee/ZigBeeDevice;

    .line 90
    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDevices:Ljava/util/ArrayList;

    if-nez v2, :cond_0

    .line 91
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDevices:Ljava/util/ArrayList;

    .line 92
    :cond_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 94
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    :goto_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    .line 99
    .local v1, "parsedResponse":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 100
    const-string v2, "&lt;"

    const-string v3, "<"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 101
    const-string v2, "&gt;"

    const-string v3, ">"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 102
    const-string v2, "&quot;"

    const-string v3, "\"\""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 104
    :try_start_1
    invoke-static {v1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_1
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1

    .line 109
    :cond_1
    :goto_1
    const-string v2, "ZigbeeScan"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "xml after 2nd parse:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const-string v2, "ZigbeeScan"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "zigbee Devices size:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDevices:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDevices:Ljava/util/ArrayList;

    return-object v2

    .line 95
    .end local v1    # "parsedResponse":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0

    .line 105
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    .restart local v1    # "parsedResponse":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 106
    .restart local v0    # "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_1
.end method

.method public parseGetEndDeviceList(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/util/HashMap;
    .locals 5
    .param p1, "response"    # Ljava/lang/String;
    .param p2, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 124
    const-string v2, "ZigbeeScan"

    const-string v3, "parseGetEndDeviceList"

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    if-nez p2, :cond_2

    .line 126
    const-string v2, "ZigbeeScan"

    const-string v3, "Discovery Zigbee: parseGetEndDeviceList(): New device."

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    new-instance v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 133
    :goto_0
    new-instance v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 134
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    .line 135
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 137
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    :goto_1
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    .line 142
    .local v1, "parsedResponse":Ljava/lang/String;
    const-string v2, "ModelCode"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 143
    const-string v2, "ZigbeeScan"

    const-string v3, "it is RTM fw"

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->rtmFW:Z

    .line 146
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 147
    const-string v2, "&lt;"

    const-string v3, "<"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 148
    const-string v2, "&gt;"

    const-string v3, ">"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 149
    const-string v2, "&quot;"

    const-string v3, "\"\""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 152
    :try_start_1
    invoke-static {v1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_1
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1

    .line 158
    :cond_1
    :goto_2
    const-string v2, "ZigbeeScan"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "xml after 2nd parse:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    const-string v2, "ZigbeeScan"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "zigbee Devices size:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    iget-object v2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    return-object v2

    .line 129
    .end local v1    # "parsedResponse":Ljava/lang/String;
    :cond_2
    const-string v2, "ZigbeeScan"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Discovery Zigbee: parseGetEndDeviceList(): Existing device. Exiting Icon: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; Existing groupIcon: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupIcon()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    iput-object p2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    goto/16 :goto_0

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto/16 :goto_1

    .line 153
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    .restart local v1    # "parsedResponse":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 154
    .restart local v0    # "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_2
.end method

.method public parseGetEndDeviceListWithStatus(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/util/HashMap;
    .locals 6
    .param p1, "response"    # Ljava/lang/String;
    .param p2, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 164
    const-string v3, "ZigbeeScan"

    const-string v4, "Unification: parseGetEndDeviceListWithStatus"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    if-nez p2, :cond_2

    .line 166
    const-string v3, "ZigbeeScan"

    const-string v4, "Discovery Zigbee: parseGetEndDeviceListWithStatus(): New device."

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    new-instance v3, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>()V

    iput-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 173
    :goto_0
    new-instance v3, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>()V

    iput-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 174
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    .line 175
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    .line 176
    const-string v3, "ZigbeeScan"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unification: xml response received: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    :try_start_0
    invoke-static {p1, p0}, Landroid/util/Xml;->parse(Ljava/lang/String;Lorg/xml/sax/ContentHandler;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    :goto_1
    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->responseBuffer:Ljava/lang/StringBuffer;

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    .line 183
    .local v2, "parsedResponse":Ljava/lang/String;
    const-string v3, "ModelCode"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 184
    const-string v3, "ZigbeeScan"

    const-string v4, " it is RTM fw"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->rtmFW:Z

    .line 187
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 188
    const-string v3, "&lt;"

    const-string v4, "<"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 189
    const-string v3, "&gt;"

    const-string v4, ">"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 190
    const-string v3, "&quot;"

    const-string v4, "\"\""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 192
    const-string v3, "ZigbeeScan"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unification: xml parsed response received: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    :try_start_1
    new-instance v1, Lorg/xml/sax/InputSource;

    invoke-direct {v1}, Lorg/xml/sax/InputSource;-><init>()V

    .line 195
    .local v1, "inputSource":Lorg/xml/sax/InputSource;
    const-string v3, "ISO-8859-1"

    invoke-virtual {v1, v3}, Lorg/xml/sax/InputSource;->setEncoding(Ljava/lang/String;)V

    .line 196
    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, v2}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lorg/xml/sax/InputSource;->setCharacterStream(Ljava/io/Reader;)V

    .line 197
    sget-object v3, Landroid/util/Xml$Encoding;->ISO_8859_1:Landroid/util/Xml$Encoding;

    invoke-virtual {v3}, Landroid/util/Xml$Encoding;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/commons/io/IOUtils;->toInputStream(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    sget-object v4, Landroid/util/Xml$Encoding;->ISO_8859_1:Landroid/util/Xml$Encoding;

    invoke-static {v3, v4, p0}, Landroid/util/Xml;->parse(Ljava/io/InputStream;Landroid/util/Xml$Encoding;Lorg/xml/sax/ContentHandler;)V
    :try_end_1
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 205
    .end local v1    # "inputSource":Lorg/xml/sax/InputSource;
    :cond_1
    :goto_2
    const-string v3, "ZigbeeScan"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unification: xml after 2nd parse:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    const-string v3, "ZigbeeScan"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unification: zigbee Devices size:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    iget-object v3, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->zigBeeDeviceList:Ljava/util/HashMap;

    return-object v3

    .line 169
    .end local v2    # "parsedResponse":Ljava/lang/String;
    :cond_2
    const-string v3, "ZigbeeScan"

    const-string v4, "Discovery Zigbee: parseGetEndDeviceListWithStatus(): Existing device."

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    iput-object p2, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    goto/16 :goto_0

    .line 179
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto/16 :goto_1

    .line 198
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    .restart local v2    # "parsedResponse":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 199
    .restart local v0    # "e":Lorg/xml/sax/SAXException;
    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_2

    .line 200
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    :catch_2
    move-exception v0

    .line 201
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 211
    invoke-super {p0, p1, p2, p3, p4}, Lorg/xml/sax/helpers/DefaultHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 213
    const-string v0, "DeviceLists"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->processValue:Z

    .line 216
    :cond_0
    const-string v0, "DeviceListType"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 217
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceListType:Z

    .line 219
    :cond_1
    const-string v0, "DeviceInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 220
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceInfo:Z

    .line 221
    new-instance v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 223
    :cond_2
    const-string v0, "DeviceInfos"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 224
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceInfos:Z

    .line 226
    :cond_3
    const-string v0, "DeviceIndex"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 227
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceIndex:Z

    .line 229
    :cond_4
    const-string v0, "DeviceID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 230
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceId:Z

    .line 231
    const-string v0, "available"

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->deviceIdAvailablity:Ljava/lang/String;

    .line 233
    :cond_5
    const-string v0, "FriendlyName"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 234
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->friendlyName:Z

    .line 236
    :cond_6
    const-string v0, "IconVersion"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 237
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->iconVersion:Z

    .line 239
    :cond_7
    const-string v0, "FirmwareVersion"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 240
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->firmwareVersion:Z

    .line 242
    :cond_8
    const-string v0, "CapabilityIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 243
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityId:Z

    .line 245
    :cond_9
    const-string v0, "CapabilityValue"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 246
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->capabilityValue:Z

    .line 248
    :cond_a
    const-string v0, "LastEventTimeStamp"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 249
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->lastEventTimeStamp:Z

    .line 251
    :cond_b
    const-string v0, "IsGroupAction"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 252
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->isGroupAction:Z

    .line 256
    :cond_c
    const-string v0, "CurrentState"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 257
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->currentState:Z

    .line 259
    :cond_d
    const-string v0, "GroupInfo"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 260
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupInfo:Z

    .line 262
    new-instance v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupedDevice:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 264
    :cond_e
    const-string v0, "GroupID"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 265
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupId:Z

    .line 267
    :cond_f
    const-string v0, "GroupName"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 268
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupName:Z

    .line 270
    :cond_10
    const-string v0, "GroupCapabilityIDs"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 271
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupCapabilityId:Z

    .line 273
    :cond_11
    const-string v0, "GroupCapabilityValues"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 274
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->groupCapabilityValues:Z

    .line 276
    :cond_12
    const-string v0, "Manufacturer"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 277
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->manufacturerName:Z

    .line 279
    :cond_13
    const-string v0, "ModelCode"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 280
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->modelCode:Z

    .line 282
    :cond_14
    const-string v0, "WeMoCertified"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 283
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->wemoCertified:Z

    .line 285
    :cond_15
    const-string v0, "productType"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 286
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productType:Z

    .line 288
    :cond_16
    const-string v0, "productName"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 289
    iput-boolean v1, p0, Lcom/belkin/wemo/cache/zigbee/GetEndDeviceListResponse;->productName:Z

    .line 291
    :cond_17
    return-void
.end method
