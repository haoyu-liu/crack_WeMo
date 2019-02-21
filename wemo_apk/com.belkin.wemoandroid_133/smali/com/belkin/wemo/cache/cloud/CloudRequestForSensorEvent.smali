.class public Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;
.super Ljava/lang/Object;
.source "CloudRequestForSensorEvent.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private array:Lorg/json/JSONArray;

.field private mCacheMgr:Lcom/belkin/wemo/cache/CacheManager;

.field private mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Lorg/json/JSONArray;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .param p3, "params"    # Lorg/json/JSONArray;

    .prologue
    const/16 v1, 0x7530

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string v0, "CloudRequestForSensorEvent"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->TAG:Ljava/lang/String;

    .line 19
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->TIMEOUT_LIMIT:I

    .line 20
    iput v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->TIMEOUT:I

    .line 22
    const-string v0, "http://10.20.90.173:6081/blink-event-webservice/wemoevent/eventSearchFilter"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->URL:Ljava/lang/String;

    .line 28
    invoke-static {p1}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->mCacheMgr:Lcom/belkin/wemo/cache/CacheManager;

    .line 29
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    .line 30
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->array:Lorg/json/JSONArray;

    .line 31
    return-void
.end method

.method private buildXMLForSensorDeviceList()Ljava/lang/String;
    .locals 6

    .prologue
    .line 105
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->mCacheMgr:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/CacheManager;->getSensorDevices()Lorg/json/JSONArray;

    move-result-object v2

    .line 106
    .local v2, "udnArray":Lorg/json/JSONArray;
    const-string v3, ""

    .line 107
    .local v3, "xmlString":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 109
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<deviceId>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</deviceId>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 107
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 110
    :catch_0
    move-exception v0

    .line 111
    .local v0, "e":Lorg/json/JSONException;
    const-string v4, "CloudRequestForSensorEvent"

    const-string v5, "There is error in fetching UDN array of sensor devices :: "

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 114
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    return-object v3
.end method

.method private buildXMLRequestforEventHistory()Ljava/lang/String;
    .locals 4

    .prologue
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<eventSearchFilter><deviceIds>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->buildXMLForSensorDeviceList()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</deviceIds>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<startTime>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->getStartTime()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</startTime>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<endTime>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->getEndTime()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</endTime>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<fetchSize>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "25"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</fetchSize>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</eventSearchFilter>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getEndTime()J
    .locals 5

    .prologue
    const-wide/16 v2, 0x0

    .line 128
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->array:Lorg/json/JSONArray;

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v4, "0"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 131
    :goto_0
    return-wide v2

    .line 128
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    goto :goto_0

    .line 129
    :catch_0
    move-exception v0

    .line 130
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "CloudRequestForSensorEvent"

    const-string v4, "JSON Exception during JSON parsing :: "

    invoke-static {v1, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private getStartTime()J
    .locals 4

    .prologue
    .line 119
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->array:Lorg/json/JSONArray;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "-1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->mCacheMgr:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/CacheManager;->getLatestEventTimeStamp()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 122
    :goto_0
    return-wide v2

    .line 119
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->array:Lorg/json/JSONArray;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getLong(I)J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    goto :goto_0

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "CloudRequestForSensorEvent"

    const-string v2, "JSON Exception during JSON parsing :: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 122
    const-wide/16 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getAdditionalHeaders()Ljava/util/Map;
    .locals 1
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
    .line 142
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->buildXMLRequestforEventHistory()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 62
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 67
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 72
    const/16 v0, 0x7530

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    const-string v0, "http://10.20.90.173:6081/blink-event-webservice/wemoevent/eventSearchFilter"

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 137
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 6
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 36
    const-string v3, "CloudRequestForSensorEvent"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "requestComplete status: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    if-eqz p1, :cond_1

    .line 39
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 40
    .local v2, "response":Ljava/lang/String;
    const-string v3, "CloudRequestForSensorEvent"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " :: response is:: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 42
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 43
    .local v1, "jsonObject":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->mCacheMgr:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v3, v1}, Lcom/belkin/wemo/cache/CacheManager;->addSenosrEventsintoDB(Lorg/json/JSONObject;)V

    .line 44
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3, v2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onSuccess(Ljava/lang/String;)V

    .line 58
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "response":Ljava/lang/String;
    :goto_0
    return-void

    .line 48
    .restart local v2    # "response":Ljava/lang/String;
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onSuccess(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 50
    .end local v2    # "response":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "CloudRequestForSensorEvent"

    const-string v4, "Exception occured in Cloud request for Sensor Event History"

    invoke-static {v3, v4, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 52
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0

    .line 56
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;->mCallback:Lcom/belkin/wemo/callback/SetAndGetActionCallBack;

    invoke-interface {v3}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method
