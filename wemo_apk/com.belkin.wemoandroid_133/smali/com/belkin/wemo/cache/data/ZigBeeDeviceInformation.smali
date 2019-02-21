.class public Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;
.super Ljava/lang/Object;
.source "ZigBeeDeviceInformation.java"


# instance fields
.field private bridgeUDN:Ljava/lang/String;

.field private capabilities:Ljava/lang/String;

.field private checkingStatus:Ljava/lang/String;

.field private discoveryState:Ljava/lang/String;

.field private endDiscoveryTime:J

.field private firmwareVersion:Ljava/lang/String;

.field private foundTime:Ljava/lang/String;

.field private groupCapability:Ljava/lang/String;

.field private groupId:I

.field private groupName:Ljava/lang/String;

.field private icon:Ljava/lang/String;

.field private iconUploadId:Ljava/lang/String;

.field private inactive:I

.field private isDiscovered:Z

.field private manufacturerName:Ljava/lang/String;

.field private modelCode:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private startDiscoveryTime:J

.field private state:I

.field private timestamp:Ljava/lang/String;

.field private uniqueID:Ljava/lang/String;

.field private wemoCertified:Ljava/lang/String;

.field private whichDiscovered:Ljava/lang/String;

.field private whichFound:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->foundTime:Ljava/lang/String;

    .line 24
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->whichFound:Ljava/lang/String;

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->timestamp:Ljava/lang/String;

    .line 28
    iput-wide v2, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->startDiscoveryTime:J

    .line 29
    iput-wide v2, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->endDiscoveryTime:J

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 31
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 32
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->isDiscovered:Z

    return-void
.end method


# virtual methods
.method public getBridgeUDN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->bridgeUDN:Ljava/lang/String;

    return-object v0
.end method

.method public getCapabilities()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->capabilities:Ljava/lang/String;

    return-object v0
.end method

.method public getCheckingStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->checkingStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getDiscoveryState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->discoveryState:Ljava/lang/String;

    return-object v0
.end method

.method public getEndDiscoveryTime()J
    .locals 2

    .prologue
    .line 68
    iget-wide v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->endDiscoveryTime:J

    return-wide v0
.end method

.method public getFirmwareVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->firmwareVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getFoundTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->foundTime:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupCapability()Ljava/lang/String;
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->groupCapability:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupId()I
    .locals 1

    .prologue
    .line 156
    iget v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->groupId:I

    return v0
.end method

.method public getGroupName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->groupName:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->icon:Ljava/lang/String;

    return-object v0
.end method

.method public getIconUploadID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->iconUploadId:Ljava/lang/String;

    return-object v0
.end method

.method public getInactive()I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->inactive:I

    return v0
.end method

.method public getIsDiscovered()Z
    .locals 1

    .prologue
    .line 220
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->isDiscovered:Z

    return v0
.end method

.method public getManufacturerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->manufacturerName:Ljava/lang/String;

    return-object v0
.end method

.method public getModelCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->modelCode:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getStartDiscoveryTime()J
    .locals 2

    .prologue
    .line 60
    iget-wide v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->startDiscoveryTime:J

    return-wide v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 148
    iget v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->state:I

    return v0
.end method

.method public getTimestamp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->timestamp:Ljava/lang/String;

    return-object v0
.end method

.method public getUniqueID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->uniqueID:Ljava/lang/String;

    return-object v0
.end method

.method public getWemoCertified()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->wemoCertified:Ljava/lang/String;

    return-object v0
.end method

.method public getWhichDiscovered()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->whichDiscovered:Ljava/lang/String;

    return-object v0
.end method

.method public getWhichFound()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->whichFound:Ljava/lang/String;

    return-object v0
.end method

.method public saveIconToFile(Landroid/graphics/Bitmap;Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "bmp"    # Landroid/graphics/Bitmap;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 228
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->getUniqueID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 229
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

    .line 230
    const/4 v2, 0x0

    .line 232
    .local v2, "out":Ljava/io/FileOutputStream;
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p2, v1, v3}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v2

    .line 233
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x5a

    invoke-virtual {p1, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 239
    if-eqz v2, :cond_0

    .line 240
    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 246
    .end local v1    # "filename":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v1

    .line 242
    .restart local v1    # "filename":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 243
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 235
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 236
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 239
    if-eqz v2, :cond_1

    .line 240
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 246
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    const-string v1, ""

    goto :goto_0

    .line 242
    .restart local v0    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 243
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 238
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    .line 239
    if-eqz v2, :cond_2

    .line 240
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 244
    :cond_2
    :goto_2
    throw v3

    .line 242
    :catch_3
    move-exception v0

    .line 243
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method public setBridgeUDN(Ljava/lang/String;)V
    .locals 0
    .param p1, "bridgeUDN"    # Ljava/lang/String;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->bridgeUDN:Ljava/lang/String;

    .line 137
    return-void
.end method

.method public setCapabilities(Ljava/lang/String;)V
    .locals 0
    .param p1, "capabilities"    # Ljava/lang/String;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->capabilities:Ljava/lang/String;

    .line 185
    return-void
.end method

.method public setCheckingStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "checkingStatus"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->checkingStatus:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public setDiscoveryState(Ljava/lang/String;)V
    .locals 0
    .param p1, "discoveryState"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->discoveryState:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setEndDiscoveryTime(J)V
    .locals 1
    .param p1, "endDiscoveryTime"    # J

    .prologue
    .line 72
    iput-wide p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->endDiscoveryTime:J

    .line 73
    return-void
.end method

.method public setFirmwareVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "firmwareVersion"    # Ljava/lang/String;

    .prologue
    .line 200
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->firmwareVersion:Ljava/lang/String;

    .line 201
    return-void
.end method

.method public setFoundTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "foundTime"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->foundTime:Ljava/lang/String;

    .line 89
    return-void
.end method

.method public setGroupCapability(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupCapability"    # Ljava/lang/String;

    .prologue
    .line 176
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->groupCapability:Ljava/lang/String;

    .line 177
    return-void
.end method

.method public setGroupId(I)V
    .locals 0
    .param p1, "groupID"    # I

    .prologue
    .line 160
    iput p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->groupId:I

    .line 161
    return-void
.end method

.method public setGroupName(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupName"    # Ljava/lang/String;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->groupName:Ljava/lang/String;

    .line 169
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 0
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 192
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->icon:Ljava/lang/String;

    .line 193
    return-void
.end method

.method public setIconUploadId(Ljava/lang/String;)V
    .locals 0
    .param p1, "uploadID"    # Ljava/lang/String;

    .prologue
    .line 216
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->iconUploadId:Ljava/lang/String;

    .line 217
    return-void
.end method

.method public setInActive(I)V
    .locals 0
    .param p1, "inactive"    # I

    .prologue
    .line 80
    iput p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->inactive:I

    .line 81
    return-void
.end method

.method public setIsDiscovered(Z)V
    .locals 0
    .param p1, "isDiscovered"    # Z

    .prologue
    .line 224
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->isDiscovered:Z

    .line 225
    return-void
.end method

.method public setManufacturerName(Ljava/lang/String;)V
    .locals 0
    .param p1, "manufacturerName"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->manufacturerName:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setModelCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "modelCode"    # Ljava/lang/String;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->modelCode:Ljava/lang/String;

    .line 209
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->name:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public setStartDiscoveryTime(J)V
    .locals 1
    .param p1, "startDiscoveryTime"    # J

    .prologue
    .line 64
    iput-wide p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->startDiscoveryTime:J

    .line 65
    return-void
.end method

.method public setState(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 152
    iput p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->state:I

    .line 153
    return-void
.end method

.method public setTimestamp(Ljava/lang/String;)V
    .locals 0
    .param p1, "timestamp"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->timestamp:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public setUniqueID(Ljava/lang/String;)V
    .locals 0
    .param p1, "uniqueID"    # Ljava/lang/String;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->uniqueID:Ljava/lang/String;

    .line 145
    return-void
.end method

.method public setWemoCertified(Ljava/lang/String;)V
    .locals 0
    .param p1, "wemoCertified"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->wemoCertified:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setWhichDiscovered(Ljava/lang/String;)V
    .locals 0
    .param p1, "whichDiscovered"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->whichDiscovered:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setWhichFound(Ljava/lang/String;)V
    .locals 0
    .param p1, "whichFound"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/ZigBeeDeviceInformation;->whichFound:Ljava/lang/String;

    .line 97
    return-void
.end method
