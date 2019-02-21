.class public Lcom/belkin/wemo/cache/cloud/CloudRequestAutoResetPowerThreshold;
.super Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;
.source "CloudRequestAutoResetPowerThreshold.java"


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "devManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "actionName"    # Ljava/lang/String;
    .param p4, "attribute"    # Lorg/json/JSONObject;

    .prologue
    .line 13
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 14
    return-void
.end method


# virtual methods
.method protected getDefaultPowerThreshold()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    const-string v0, "2"

    return-object v0
.end method

.method protected getPowerThresold()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    const-string v0, "0"

    return-object v0
.end method
