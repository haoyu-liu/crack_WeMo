.class public Lcom/belkin/wemo/cache/utils/Converters;
.super Ljava/lang/Object;
.source "Converters.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertZigBeeDeviceInformationToDeviceInformation(Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 10
    .param p0, "dev"    # Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;

    .prologue
    .line 11
    new-instance v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getUniqueID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getState()I

    move-result v3

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v9

    invoke-direct/range {v0 .. v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getCheckingStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCheckingStatus(Ljava/lang/String;)V

    .line 15
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getDiscoveryState()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDiscoveryState(Ljava/lang/String;)V

    .line 16
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 17
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getInactive()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 18
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getIsDiscovered()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 19
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getTimestamp()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setTimestamp(Ljava/lang/String;)V

    .line 20
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getWhichFound()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setWhichFound(Ljava/lang/String;)V

    .line 21
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getWhichDiscovered()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setWhichDiscovered(Ljava/lang/String;)V

    .line 22
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getFoundTime()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFoundTime(Ljava/lang/String;)V

    .line 23
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getGroupId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setLEDGroupID(I)V

    .line 24
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getGroupName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setLEDGroupName(Ljava/lang/String;)V

    .line 25
    return-object v0
.end method
