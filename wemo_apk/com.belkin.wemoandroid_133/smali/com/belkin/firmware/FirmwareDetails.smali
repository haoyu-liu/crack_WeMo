.class public Lcom/belkin/firmware/FirmwareDetails;
.super Ljava/lang/Object;
.source "FirmwareDetails.java"


# instance fields
.field bridgeUDN:Ljava/lang/String;

.field currentVersion:Ljava/lang/String;

.field deviceType:Ljava/lang/String;

.field md5:Ljava/lang/String;

.field uniqueID:Ljava/lang/String;

.field updateURL:Ljava/lang/String;

.field updateVersion:Ljava/lang/String;

.field zigbeeIds:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "uniqueID"    # Ljava/lang/String;
    .param p2, "currentVersion"    # Ljava/lang/String;
    .param p3, "updateURL"    # Ljava/lang/String;
    .param p4, "updateVersion"    # Ljava/lang/String;
    .param p5, "md5"    # Ljava/lang/String;
    .param p6, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->bridgeUDN:Ljava/lang/String;

    .line 19
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->zigbeeIds:Ljava/lang/String;

    .line 25
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->uniqueID:Ljava/lang/String;

    .line 26
    iput-object p2, p0, Lcom/belkin/firmware/FirmwareDetails;->currentVersion:Ljava/lang/String;

    .line 27
    iput-object p3, p0, Lcom/belkin/firmware/FirmwareDetails;->updateURL:Ljava/lang/String;

    .line 28
    iput-object p4, p0, Lcom/belkin/firmware/FirmwareDetails;->updateVersion:Ljava/lang/String;

    .line 29
    iput-object p5, p0, Lcom/belkin/firmware/FirmwareDetails;->md5:Ljava/lang/String;

    .line 30
    iput-object p6, p0, Lcom/belkin/firmware/FirmwareDetails;->deviceType:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "uniqueID"    # Ljava/lang/String;
    .param p2, "currentVersion"    # Ljava/lang/String;
    .param p3, "updateURL"    # Ljava/lang/String;
    .param p4, "updateVersion"    # Ljava/lang/String;
    .param p5, "md5"    # Ljava/lang/String;
    .param p6, "deviceType"    # Ljava/lang/String;
    .param p7, "bridgeUDN"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->bridgeUDN:Ljava/lang/String;

    .line 19
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->zigbeeIds:Ljava/lang/String;

    .line 36
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->uniqueID:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lcom/belkin/firmware/FirmwareDetails;->currentVersion:Ljava/lang/String;

    .line 38
    iput-object p3, p0, Lcom/belkin/firmware/FirmwareDetails;->updateURL:Ljava/lang/String;

    .line 39
    iput-object p4, p0, Lcom/belkin/firmware/FirmwareDetails;->updateVersion:Ljava/lang/String;

    .line 40
    iput-object p5, p0, Lcom/belkin/firmware/FirmwareDetails;->md5:Ljava/lang/String;

    .line 41
    iput-object p6, p0, Lcom/belkin/firmware/FirmwareDetails;->deviceType:Ljava/lang/String;

    .line 42
    iput-object p7, p0, Lcom/belkin/firmware/FirmwareDetails;->bridgeUDN:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "firmwareObject"    # Lorg/json/JSONObject;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->bridgeUDN:Ljava/lang/String;

    .line 19
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->zigbeeIds:Ljava/lang/String;

    .line 48
    :try_start_0
    const-string v1, "udn"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->uniqueID:Ljava/lang/String;

    .line 50
    const-string v1, "url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->updateURL:Ljava/lang/String;

    .line 51
    const-string v1, "version"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->updateVersion:Ljava/lang/String;

    .line 52
    const-string v1, "checksum"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->md5:Ljava/lang/String;

    .line 53
    const-string v1, "modelCode"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->deviceType:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :goto_0
    return-void

    .line 54
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    .param p1, "firmwareObject"    # Lorg/json/JSONObject;
    .param p2, "uniqueID"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->bridgeUDN:Ljava/lang/String;

    .line 19
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->zigbeeIds:Ljava/lang/String;

    .line 66
    :try_start_0
    iput-object p2, p0, Lcom/belkin/firmware/FirmwareDetails;->uniqueID:Ljava/lang/String;

    .line 68
    const-string v1, "url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->updateURL:Ljava/lang/String;

    .line 69
    const-string v1, "version"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->updateVersion:Ljava/lang/String;

    .line 70
    const-string v1, "checksum"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->md5:Ljava/lang/String;

    .line 71
    const-string v1, "modelCode"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->deviceType:Ljava/lang/String;

    .line 72
    const-string v1, "udn"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->zigbeeIds:Ljava/lang/String;

    .line 73
    const-string v1, "bridgeUDN"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->bridgeUDN:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :goto_0
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getBridgeUDN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->bridgeUDN:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->currentVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->deviceType:Ljava/lang/String;

    return-object v0
.end method

.method public getMd5()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->md5:Ljava/lang/String;

    return-object v0
.end method

.method public getUniqueID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->uniqueID:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdateURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->updateURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdateVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->updateVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getZigbeeIds()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/belkin/firmware/FirmwareDetails;->zigbeeIds:Ljava/lang/String;

    return-object v0
.end method

.method public setBridgeUDN(Ljava/lang/String;)V
    .locals 0
    .param p1, "bridgeUDN"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->bridgeUDN:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setCurrentVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "currentVersion"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->currentVersion:Ljava/lang/String;

    .line 94
    return-void
.end method

.method public setDeviceType(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->deviceType:Ljava/lang/String;

    .line 120
    return-void
.end method

.method public setMd5(Ljava/lang/String;)V
    .locals 0
    .param p1, "md5"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->md5:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public setUniqueID(Ljava/lang/String;)V
    .locals 0
    .param p1, "uniqueID"    # Ljava/lang/String;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->uniqueID:Ljava/lang/String;

    .line 88
    return-void
.end method

.method public setUpdateURL(Ljava/lang/String;)V
    .locals 0
    .param p1, "updateURL"    # Ljava/lang/String;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->updateURL:Ljava/lang/String;

    .line 100
    return-void
.end method

.method public setUpdateVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "updateVersion"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->updateVersion:Ljava/lang/String;

    .line 106
    return-void
.end method

.method public setZigbeeIds(Ljava/lang/String;)V
    .locals 0
    .param p1, "zigbeeIds"    # Ljava/lang/String;

    .prologue
    .line 135
    iput-object p1, p0, Lcom/belkin/firmware/FirmwareDetails;->zigbeeIds:Ljava/lang/String;

    .line 136
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FirmwareDetails [uniqueID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->uniqueID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", currentVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->currentVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", updateURL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->updateURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", updateVersion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->updateVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", md5="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->md5:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", deviceType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->deviceType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bridgeUDN="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", zigbeeIds="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/firmware/FirmwareDetails;->zigbeeIds:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
