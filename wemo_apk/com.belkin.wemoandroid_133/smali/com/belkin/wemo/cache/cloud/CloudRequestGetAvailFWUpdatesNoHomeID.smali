.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailFWUpdatesNoHomeID;
.super Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;
.source "CloudRequestGetAvailFWUpdatesNoHomeID.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/json/JSONArray;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceList"    # Lorg/json/JSONArray;

    .prologue
    .line 13
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;-><init>(Landroid/content/Context;Lorg/json/JSONArray;Ljava/lang/String;)V

    .line 14
    return-void
.end method


# virtual methods
.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailFWUpdatesNoHomeID;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    return v0
.end method

.method protected onRequestFailed()V
    .locals 4

    .prologue
    .line 28
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailFWUpdatesNoHomeID;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v1, "available_fw_updates"

    const-string v2, "false"

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    return-void
.end method
