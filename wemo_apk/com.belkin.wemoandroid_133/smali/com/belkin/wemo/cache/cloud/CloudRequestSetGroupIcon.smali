.class public Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;
.super Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;
.source "CloudRequestSetGroupIcon.java"


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "iconLocation"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    const-class v0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->TAG:Ljava/lang/String;

    .line 17
    return-void
.end method


# virtual methods
.method protected getURLSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    const-string v0, "?uploadType=WEMO_GROUP_ICON"

    return-object v0
.end method

.method public requestComplete(ZI[B)V
    .locals 8
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 21
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    .line 22
    .local v0, "deviceListManager":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "requestComplete with success: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " statusCode: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, p3}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    if-eqz p1, :cond_4

    .line 25
    :try_start_0
    new-instance v4, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-direct {v4, p3, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 26
    .local v4, "stringResponse":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->parseResponse(Ljava/lang/String;)Z

    move-result v3

    .line 28
    .local v3, "responseParse":Z
    if-eqz v3, :cond_1

    .line 29
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->udn:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDevicesInGroup(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 30
    .local v1, "devices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->iconLocation:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->uploadIdFromCloud:Ljava/lang/String;

    invoke-virtual {v0, v5, v6, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateGroupLedIconFile(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 32
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 33
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-interface {v5}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onSuccess()V

    .line 35
    :cond_0
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->udn:Ljava/lang/String;

    invoke-virtual {v0, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .end local v1    # "devices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "responseParse":Z
    .end local v4    # "stringResponse":Ljava/lang/String;
    :goto_0
    return-void

    .line 37
    .restart local v3    # "responseParse":Z
    .restart local v4    # "stringResponse":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 38
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 40
    :cond_2
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->udn:Ljava/lang/String;

    invoke-virtual {v0, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 42
    .end local v3    # "responseParse":Z
    .end local v4    # "stringResponse":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 43
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->TAG:Ljava/lang/String;

    const-string v6, "UnsupportedEncodingException while parsing cloud response: "

    invoke-static {v5, v6, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 44
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 45
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 47
    :cond_3
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->udn:Ljava/lang/String;

    invoke-virtual {v0, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 51
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_4
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 52
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v5

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    .line 54
    :cond_5
    const-string v5, "update"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;->udn:Ljava/lang/String;

    invoke-virtual {v0, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
