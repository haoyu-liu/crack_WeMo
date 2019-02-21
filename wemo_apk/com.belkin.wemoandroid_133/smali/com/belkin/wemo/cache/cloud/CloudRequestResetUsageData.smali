.class public Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;
.super Ljava/lang/Object;
.source "CloudRequestResetUsageData.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final TAG:Ljava/lang/String; = "CloudRequestResetUsageData"


# instance fields
.field private final TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mUdn:Ljava/lang/String;

.field private macAddress:Ljava/lang/String;

.field private notification:Ljava/lang/String;

.field private pluginID:Ljava/lang/String;


# direct methods
.method public varargs constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "devMgr"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "plugin"    # Ljava/lang/String;
    .param p4, "mac"    # Ljava/lang/String;
    .param p5, "notifType"    # [Ljava/lang/Object;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/16 v0, 0x64

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->TIMEOUT:I

    .line 14
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->TIMEOUT_LIMIT:I

    .line 15
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

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->URL:Ljava/lang/String;

    .line 25
    array-length v0, p5

    if-lez v0, :cond_0

    .line 27
    const/4 v0, 0x0

    aget-object v0, p5, v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->notification:Ljava/lang/String;

    .line 29
    :cond_0
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->pluginID:Ljava/lang/String;

    .line 30
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->macAddress:Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 32
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->mUdn:Ljava/lang/String;

    .line 33
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
    .locals 3

    .prologue
    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<plugins><plugin>  <recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->pluginID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</recipientId>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  <macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->macAddress:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  <modelCode>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->mUdn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</modelCode> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "xmlString":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "<content><![CDATA[<setClearDataUsage><plugin><macAddress>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->macAddress:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</macAddress></plugin></setClearDataUsage>]]>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</content></plugin></plugins>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 68
    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 42
    const/16 v0, 0x64

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 48
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
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

.method public requestComplete(ZI[B)V
    .locals 7
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 86
    const-string v3, "CloudRequestResetUsageData"

    const-string v4, "resetUsageData over remote requestComple"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const/4 v2, 0x0

    .line 88
    .local v2, "isSuccess":Z
    if-eqz p1, :cond_0

    .line 90
    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v0, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 91
    .local v0, "cloudResponse":Ljava/lang/String;
    const-string v3, "CloudRequestResetUsageData"

    invoke-static {v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-nez v3, :cond_0

    .line 94
    const/4 v2, 0x1

    .line 102
    .end local v0    # "cloudResponse":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->notification:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;->mUdn:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    return-void

    .line 97
    :catch_0
    move-exception v1

    .line 98
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "CloudRequestResetUsageData"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in requestComplete e:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
