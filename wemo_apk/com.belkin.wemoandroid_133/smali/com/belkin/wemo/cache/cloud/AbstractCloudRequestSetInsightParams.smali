.class public abstract Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;
.super Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest;
.source "AbstractCloudRequestSetInsightParams.java"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private executeAction:Ljava/lang/String;

.field private insightParams:Lorg/json/JSONObject;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "devManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "actionName"    # Ljava/lang/String;
    .param p4, "attribute"    # Lorg/json/JSONObject;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest;-><init>()V

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/message/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->URL:Ljava/lang/String;

    .line 17
    const-string v0, "SDK_CloudRequestSetInsightParams"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->TAG:Ljava/lang/String;

    .line 18
    const v0, 0x9c40

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->TIMEOUT_LIMIT:I

    .line 22
    const/16 v0, 0x2710

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->TIMEOUT:I

    .line 27
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 28
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 29
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->insightParams:Lorg/json/JSONObject;

    .line 30
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->executeAction:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method public abstract getBody()Ljava/lang/String;
.end method

.method public getDeviceInfo()Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 114
    const/4 v0, 0x0

    return-object v0
.end method

.method public getInsightParams()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->insightParams:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 53
    const v0, 0x9c40

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    const/4 v0, 0x0

    return-object v0
.end method

.method public requestComplete(ZI[B)V
    .locals 8
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 66
    const-string v4, "SDK_CloudRequestSetInsightParams"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cloud Request for set insight params. isSucess:  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    if-eqz p1, :cond_6

    .line 69
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-direct {v2, p3, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 70
    .local v2, "response":Ljava/lang/String;
    const-string v4, "SDK_CloudRequestSetInsightParams"

    invoke-static {v4, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    new-instance v4, Lcom/belkin/wemo/cache/utils/InsightParamsCloudResponseParser;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/utils/InsightParamsCloudResponseParser;-><init>()V

    invoke-virtual {v4, v2}, Lcom/belkin/wemo/cache/utils/InsightParamsCloudResponseParser;->parseSetResponse(Ljava/lang/String;)Z

    move-result v3

    .line 72
    .local v3, "responseParse":Z
    if-eqz v3, :cond_1

    .line 73
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 75
    .local v0, "deviceAttributes":Lorg/json/JSONObject;
    :try_start_1
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->executeAction:Ljava/lang/String;

    const-string v5, "SetPowerThreshold"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 76
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->insightParams:Lorg/json/JSONObject;

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 88
    :cond_0
    :goto_0
    :try_start_2
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateAtributeListForInsightInRemote(Lorg/json/JSONObject;Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 90
    .end local v0    # "deviceAttributes":Lorg/json/JSONObject;
    :cond_1
    const-string v4, "SDK_CloudRequestSetInsightParams"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Response parse: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "set_state"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 93
    if-eqz v3, :cond_5

    .line 94
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v4

    invoke-interface {v4}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onSuccess()V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1

    .line 110
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParse":Z
    :cond_2
    :goto_1
    return-void

    .line 77
    .restart local v0    # "deviceAttributes":Lorg/json/JSONObject;
    .restart local v2    # "response":Ljava/lang/String;
    .restart local v3    # "responseParse":Z
    :cond_3
    :try_start_3
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->executeAction:Ljava/lang/String;

    const-string v5, "SetInsightHomeSettings"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 78
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_CURRENCY:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->insightParams:Lorg/json/JSONObject;

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_CURRENCY:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->insightParams:Lorg/json/JSONObject;

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 84
    :catch_0
    move-exception v1

    .line 85
    .local v1, "e":Lorg/json/JSONException;
    :try_start_4
    const-string v4, "SDK_CloudRequestSetInsightParams"

    const-string v5, "JSONException while saving attibutes to DB"

    invoke-static {v4, v5, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 99
    .end local v0    # "deviceAttributes":Lorg/json/JSONObject;
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParse":Z
    :catch_1
    move-exception v1

    .line 100
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    const-string v4, "SDK_CloudRequestSetInsightParams"

    const-string v5, "UnsupportedEncodingException while parsing API response "

    invoke-static {v4, v5, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 80
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "deviceAttributes":Lorg/json/JSONObject;
    .restart local v2    # "response":Ljava/lang/String;
    .restart local v3    # "responseParse":Z
    :cond_4
    :try_start_5
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->executeAction:Ljava/lang/String;

    const-string v5, "ScheduleDataExport"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 81
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_EMAIL:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->insightParams:Lorg/json/JSONObject;

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_EMAIL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_INTERVAL:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->insightParams:Lorg/json/JSONObject;

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_INTERVAL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_0

    .line 96
    .end local v0    # "deviceAttributes":Lorg/json/JSONObject;
    :cond_5
    :try_start_6
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_1

    .line 104
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "responseParse":Z
    :cond_6
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "set_state"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->mDeviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 106
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequestSetInsightParams;->getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;->onError(Ljava/lang/String;)V

    goto/16 :goto_1
.end method
