.class public Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;
.super Ljava/lang/Object;
.source "CloudRequestForAppRecovery.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private homeID:Ljava/lang/String;

.field private mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

.field private mContext:Landroid/content/Context;

.field private mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

.field private options:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "activity"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;
    .param p3, "homeID"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/firmware/upgrades"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->URL:Ljava/lang/String;

    .line 22
    const-string v0, "SDK_CloudRequestForAppRecovery"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->TAG:Ljava/lang/String;

    .line 23
    const/16 v0, 0xfa0

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->TIMEOUT_LIMIT:I

    .line 24
    const/16 v0, 0x2710

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->TIMEOUT:I

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->homeID:Ljava/lang/String;

    .line 29
    const-string v0, "1"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->options:Ljava/lang/String;

    .line 32
    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    .line 33
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mContext:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .line 35
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->homeID:Ljava/lang/String;

    .line 36
    return-void
.end method

.method private parseErrorCode(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6
    .param p1, "response"    # Ljava/lang/String;
    .param p2, "statusCode"    # I

    .prologue
    .line 110
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 112
    .local v2, "json":Lorg/json/JSONObject;
    const/16 v3, 0x193

    if-ne p2, v3, :cond_0

    .line 113
    const-string v3, "Error"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "code"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "code":Ljava/lang/String;
    :goto_0
    const-string v3, "SDK_CloudRequestForAppRecovery"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " AppRecovery error code is :: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .end local v0    # "code":Ljava/lang/String;
    .end local v2    # "json":Lorg/json/JSONObject;
    :goto_1
    return-object v0

    .line 116
    .restart local v2    # "json":Lorg/json/JSONObject;
    :cond_0
    const-string v3, "error"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "resultCode"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "code"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .restart local v0    # "code":Ljava/lang/String;
    goto :goto_0

    .line 120
    .end local v0    # "code":Ljava/lang/String;
    .end local v2    # "json":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 121
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "SDK_CloudRequestForAppRecovery"

    const-string v4, " AppRecovery exception during parsing json errorcode :: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 122
    const/4 v0, 0x0

    goto :goto_1
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
    .line 143
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 128
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 40
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 50
    const/16 v0, 0xfa0

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 3

    .prologue
    .line 55
    const-string v0, "SDK_CloudRequestForAppRecovery"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Inside getURL :: consistentFlag is:  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget-boolean v2, v2, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget-boolean v0, v0, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    if-nez v0, :cond_0

    const-string v0, "2"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->options:Ljava/lang/String;

    .line 58
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->homeID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?options="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->options:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 57
    :cond_0
    const-string v0, "1"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->options:Ljava/lang/String;

    goto :goto_0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 133
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 138
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 12
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    const/16 v11, 0x193

    const/16 v10, 0x190

    const/4 v9, 0x2

    const/4 v8, 0x0

    .line 69
    const/4 v2, 0x0

    .line 70
    .local v2, "response":Ljava/lang/String;
    const/4 v1, 0x0

    .line 71
    .local v1, "errorCode":Ljava/lang/String;
    const-string v5, "SDK_CloudRequestForAppRecovery"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "in requestComplete :: Response success is :: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " :: statusCode is :: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    if-eqz p3, :cond_0

    .line 74
    :try_start_0
    new-instance v3, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-direct {v3, p3, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "response":Ljava/lang/String;
    .local v3, "response":Ljava/lang/String;
    move-object v2, v3

    .line 78
    .end local v3    # "response":Ljava/lang/String;
    .restart local v2    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    const-string v5, "SDK_CloudRequestForAppRecovery"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, " :: response of fwUpgradeInfo API is :: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    if-eqz p1, :cond_2

    .line 80
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    const/4 v6, 0x1

    iput-boolean v6, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    .line 81
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iput v8, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    .line 82
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iput v8, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    .line 83
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->setAppRecoveryData(Lcom/belkin/wemo/cache/utils/WemoAppRecovery;)V

    .line 106
    :cond_1
    :goto_1
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e1":Ljava/io/UnsupportedEncodingException;
    const-string v5, "SDK_CloudRequestForAppRecovery"

    const-string v6, " ::Exception during encoding of cloud response :: "

    invoke-static {v5, v6, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 85
    .end local v0    # "e1":Ljava/io/UnsupportedEncodingException;
    :cond_2
    if-eq p2, v11, :cond_3

    if-ne p2, v10, :cond_1

    .line 86
    :cond_3
    invoke-direct {p0, v2, p2}, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->parseErrorCode(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 87
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, "ERR_002"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    if-eq p2, v11, :cond_6

    :cond_4
    const-string v5, "WEMO_415"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    const-string v5, "WEMO_414"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_5
    if-ne p2, v10, :cond_1

    .line 88
    :cond_6
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iput-boolean v8, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    .line 89
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget v6, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    .line 90
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->setAppRecoveryData(Lcom/belkin/wemo/cache/utils/WemoAppRecovery;)V

    .line 93
    const-string v5, "SDK_CloudRequestForAppRecovery"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "appRecovery ::  counter ::"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget v7, v7, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " :: consistentFlag ::"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget-boolean v7, v7, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " :: maxRetryCount ::"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget v7, v7, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget v5, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->counter:I

    if-le v5, v9, :cond_1

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget-boolean v5, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    if-nez v5, :cond_1

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget v5, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    if-ge v5, v9, :cond_1

    .line 95
    new-instance v4, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mContext:Landroid/content/Context;

    invoke-direct {v4, v5, v6}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)V

    .line 96
    .local v4, "rmgr":Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
    const-string v5, "SDK_CloudRequestForAppRecovery"

    const-string v6, "Enabling Remote Access"

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->enableRemoteAccess()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 98
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iput-boolean v8, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->consistentFlag:Z

    .line 99
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget v6, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v5, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->maxRetryCount:I

    .line 100
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;->mWemoAppRecovery:Lcom/belkin/wemo/cache/utils/WemoAppRecovery;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/utils/WemoAppRecovery;->setAppRecoveryData(Lcom/belkin/wemo/cache/utils/WemoAppRecovery;)V

    goto/16 :goto_1
.end method
