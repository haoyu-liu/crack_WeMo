.class public Lcom/belkin/wemo/cache/utils/WemoUtils;
.super Ljava/lang/Object;
.source "WemoUtils.java"


# static fields
.field private static final FW_UPGRADE_STATE_MAP_FILENAME:Ljava/lang/String; = "fw_upgrade_state_map"

.field private static final TAG:Ljava/lang/String;

.field private static capabilityProfileNameToIDHashMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static isAppInForeground:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/belkin/wemo/cache/utils/WemoUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    .line 31
    const/4 v0, 0x0

    sput-boolean v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->isAppInForeground:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createSSDPPacket(Ljava/lang/String;ILjava/lang/String;)Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .locals 8
    .param p0, "ipAddress"    # Ljava/lang/String;
    .param p1, "port"    # I
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    .line 103
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "http://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/setup.xml"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 104
    .local v4, "urlBase":Ljava/lang/String;
    const-string v1, "urn:Belkin:service:basicevent:1"

    .line 105
    .local v1, "devType":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "HTTP/1.1 200 OK\nCACHE-CONTROL: max-age=86400\nST: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "USN"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "::"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "LOCATION"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 106
    .local v3, "packetStr":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 107
    .local v0, "byteArray":[B
    new-instance v2, Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    array-length v5, v0

    invoke-direct {v2, v0, v5}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;-><init>([BI)V

    .line 108
    .local v2, "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->setTimeStamp(J)V

    .line 109
    return-object v2
.end method

.method public static getCapabilityID(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "capabilityName"    # Ljava/lang/String;

    .prologue
    .line 133
    invoke-static {}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getCapabilityProfileNameToIDHashMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getCapabilityProfileNameToIDHashMap()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 113
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    .line 116
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "onOff"

    const-string v2, "10006"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "levelControl"

    const-string v2, "10008"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "sleepFader"

    const-string v2, "30008"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "levelControlMove"

    const-string v2, "30009"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "levelControlStop"

    const-string v2, "3000A"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "identify"

    const-string v2, "10003"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "colorControl"

    const-string v2, "10300"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "colorTemperature"

    const-string v2, "30301"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "iasZone"

    const-string v2, "10500"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "sensorConfig"

    const-string v2, "20500"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "sensorTestMode"

    const-string v2, "30501"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    const-string v1, "sensorKeyPress"

    const-string v2, "20502"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->capabilityProfileNameToIDHashMap:Ljava/util/Map;

    return-object v0
.end method

.method public static getProductName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "modelCode"    # Ljava/lang/String;

    .prologue
    .line 62
    const-string v0, ""

    .line 64
    .local v0, "productName":Ljava/lang/String;
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 65
    const-string v1, "F7C040"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 66
    const-string v0, "AlarmSensor"

    .line 75
    :cond_0
    :goto_0
    return-object v0

    .line 67
    :cond_1
    const-string v1, "F7C041"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 68
    const-string v0, "PIR"

    goto :goto_0

    .line 69
    :cond_2
    const-string v1, "F7C039"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 70
    const-string v0, "Fob"

    goto :goto_0

    .line 71
    :cond_3
    const-string v1, "F7C038"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 72
    const-string v0, "DWSensor"

    goto :goto_0
.end method

.method public static getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "manufacturer"    # Ljava/lang/String;
    .param p1, "modelCode"    # Ljava/lang/String;

    .prologue
    .line 90
    const-string v0, "file:///android_asset/www/img/"

    .line 91
    .local v0, "filepath":Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 92
    const-string v1, ""

    .line 99
    :goto_0
    return-object v1

    .line 95
    :cond_0
    const-string v2, " "

    const-string v3, "_"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 96
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "bulb_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".png"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 98
    .local v1, "imageURL":Ljava/lang/String;
    sget-object v2, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "imageURL::"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static isAppInForeground()Z
    .locals 3

    .prologue
    .line 79
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Connectivity: Is App in foreground: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/belkin/wemo/cache/utils/WemoUtils;->isAppInForeground:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    sget-boolean v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->isAppInForeground:Z

    return v0
.end method

.method public static isGetEndDevicesWithStatusSupported(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Z
    .locals 5
    .param p0, "bridgeUDN"    # Ljava/lang/String;
    .param p1, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 137
    const/4 v2, 0x0

    .line 138
    .local v2, "isSupported":Z
    if-eqz p0, :cond_0

    .line 140
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    invoke-virtual {v3, p0}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 141
    .local v1, "dev":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_0

    .line 142
    const-string v3, "GetEndDevicesWithStatus"

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 144
    .local v0, "actionGetEndDeviceWithStatus":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_1

    .line 145
    sget-object v3, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v4, "GetEndDevicesWithStatus UpNp Action Called"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    const/4 v2, 0x1

    .line 153
    .end local v0    # "actionGetEndDeviceWithStatus":Lorg/cybergarage/upnp/Action;
    .end local v1    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_0
    :goto_0
    return v2

    .line 148
    .restart local v0    # "actionGetEndDeviceWithStatus":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_1
    sget-object v3, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v4, "GetEndDevices UpNp Action Called"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static isLEDModelCodeSupported(Ljava/lang/String;)Z
    .locals 6
    .param p0, "modelCode"    # Ljava/lang/String;

    .prologue
    .line 43
    const/4 v2, 0x0

    .line 44
    .local v2, "isSupported":Z
    sget-object v0, Lcom/belkin/wemo/cache/utils/Constants;->SUPPORTED_LED_MODELCODE_ARRAY:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v4, v0, v1

    .line 45
    .local v4, "supportedModelCode":Ljava/lang/String;
    invoke-virtual {p0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 46
    const/4 v2, 0x1

    .line 51
    .end local v4    # "supportedModelCode":Ljava/lang/String;
    :cond_0
    return v2

    .line 44
    .restart local v4    # "supportedModelCode":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static readFirmwareUpgradeInProgressState(Landroid/content/Context;)Ljava/util/Map;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 182
    sget-object v5, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v6, "Requesting readFirmwareUpgradeInProgressState..."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 185
    .local v2, "fwUpgradeInProgressDataMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;>;"
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    const-string v6, "fw_upgrade_state_map"

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 187
    .local v4, "stateFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 190
    :try_start_0
    new-instance v3, Ljava/io/ObjectInputStream;

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v5}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 191
    .local v3, "is":Ljava/io/ObjectInputStream;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/util/Map;

    move-object v2, v0

    .line 192
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->close()V
    :try_end_0
    .catch Ljava/io/StreamCorruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3

    .line 206
    .end local v3    # "is":Ljava/io/ObjectInputStream;
    :goto_0
    return-object v2

    .line 193
    :catch_0
    move-exception v1

    .line 194
    .local v1, "e":Ljava/io/StreamCorruptedException;
    sget-object v5, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v6, "StreamCorruptedException while reading fwUpgradeInProgressDataMap from memory: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 196
    .end local v1    # "e":Ljava/io/StreamCorruptedException;
    :catch_1
    move-exception v1

    .line 197
    .local v1, "e":Ljava/io/FileNotFoundException;
    sget-object v5, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v6, "FileNotFoundException while reading fwUpgradeInProgressDataMap from memory: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 198
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v1

    .line 199
    .local v1, "e":Ljava/io/IOException;
    sget-object v5, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v6, "IOException while reading fwUpgradeInProgressDataMap from memory: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 200
    .end local v1    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v1

    .line 201
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    sget-object v5, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v6, "ClassNotFoundException while reading fwUpgradeInProgressDataMap from memory: "

    invoke-static {v5, v6, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 204
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :cond_0
    sget-object v5, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v6, "fwUpgradeInProgressDataMap file in memory does not exist. Thus it is assumed that no device FW update in progress."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static recreateControlPointDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;Landroid/content/Context;)Lorg/cybergarage/upnp/Device;
    .locals 4
    .param p0, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    sget-object v1, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Recreating control point device for UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 57
    .local v0, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v2

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/belkin/wemo/cache/utils/WemoUtils;->createSSDPPacket(Ljava/lang/String;ILjava/lang/String;)Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lorg/cybergarage/upnp/ControlPoint;->searchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;ZZ)V

    .line 58
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    return-object v1
.end method

.method public static setAppForeground(Z)V
    .locals 3
    .param p0, "flag"    # Z

    .prologue
    .line 84
    sget-object v0, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setAppForeground() flag::"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    sput-boolean p0, Lcom/belkin/wemo/cache/utils/WemoUtils;->isAppInForeground:Z

    .line 86
    return-void
.end method

.method public static writeFirmwareUpgradeInProgressState(Ljava/util/Map;Landroid/content/Context;)Z
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;",
            ">;",
            "Landroid/content/Context;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "fwUpgradeInProgressDataMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;>;"
    sget-object v4, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v5, "Requesting writeFirmwareUpgradeInProgressState..."

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    const/4 v1, 0x0

    .line 160
    .local v1, "isWritten":Z
    new-instance v3, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    const-string v5, "fw_upgrade_state_map"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 163
    .local v3, "stateFile":Ljava/io/File;
    :try_start_0
    new-instance v2, Ljava/io/ObjectOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v4}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 164
    .local v2, "outputStream":Ljava/io/ObjectOutputStream;
    invoke-virtual {v2, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 165
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->flush()V

    .line 166
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 167
    const/4 v1, 0x0

    .line 176
    .end local v2    # "outputStream":Ljava/io/ObjectOutputStream;
    :goto_0
    sget-object v4, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "writeFirmwareUpgradeInProgressState: isWritten: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    return v1

    .line 168
    :catch_0
    move-exception v0

    .line 170
    .local v0, "e":Ljava/io/FileNotFoundException;
    sget-object v4, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v5, "FileNotFoundException while writing fwUpgradeInProgressDataMap to memory: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 171
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 173
    .local v0, "e":Ljava/io/IOException;
    sget-object v4, Lcom/belkin/wemo/cache/utils/WemoUtils;->TAG:Ljava/lang/String;

    const-string v5, "IOException while writing fwUpgradeInProgressDataMap to memory: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
