.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;
.super Ljava/lang/Object;
.source "CloudRequestGetAvailableFWUpdates.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field protected URL:Ljava/lang/String;

.field private deviceList:Lorg/json/JSONArray;

.field private homeID:Ljava/lang/String;

.field private isRemoteEnabled:Ljava/lang/Boolean;

.field protected mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/json/JSONArray;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "deviceList"    # Lorg/json/JSONArray;
    .param p3, "homeID"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const v0, 0x9c40

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->TIMEOUT_LIMIT:I

    .line 23
    const/16 v0, 0x2710

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->TIMEOUT:I

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->homeID:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->isRemoteEnabled:Ljava/lang/Boolean;

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/firmware/upgrades"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->URL:Ljava/lang/String;

    .line 32
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 33
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->isRemoteEnabled:Ljava/lang/Boolean;

    .line 34
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->deviceList:Lorg/json/JSONArray;

    .line 35
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->homeID:Ljava/lang/String;

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->TAG:Ljava/lang/String;

    .line 38
    return-void
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
    .line 113
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->deviceList:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 98
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 52
    const v0, 0x9c40

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->isRemoteEnabled:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->homeID:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->homeID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 61
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->URL:Ljava/lang/String;

    goto :goto_0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 108
    const/4 v0, 0x1

    return v0
.end method

.method protected onRequestFailed()V
    .locals 4

    .prologue
    .line 91
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 92
    .local v0, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailFWUpdatesNoHomeID;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->deviceList:Lorg/json/JSONArray;

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailFWUpdatesNoHomeID;-><init>(Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 93
    return-void
.end method

.method public requestComplete(ZI[B)V
    .locals 5
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 72
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "success: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    if-eqz p1, :cond_1

    .line 75
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, p3, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 76
    .local v1, "response":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->TAG:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    if-eqz v1, :cond_0

    .line 78
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v3, "available_fw_updates"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .end local v1    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->TAG:Ljava/lang/String;

    const-string v3, "UnsupportedEncodingException during parsing of Get Available FWs from cloud: "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 85
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_1
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetAvailableFWUpdates;->onRequestFailed()V

    goto :goto_0
.end method
