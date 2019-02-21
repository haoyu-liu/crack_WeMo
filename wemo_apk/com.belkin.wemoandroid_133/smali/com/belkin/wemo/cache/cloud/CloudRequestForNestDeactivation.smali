.class public Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;
.super Ljava/lang/Object;
.source "CloudRequestForNestDeactivation.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private cloudURL:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V
    .locals 4
    .param p1, "devMgr"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/16 v2, 0x7530

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-class v1, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->TAG:Ljava/lang/String;

    .line 13
    iput v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->TIMEOUT_LIMIT:I

    .line 16
    iput v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->TIMEOUT:I

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/apis/http/oauth2/v1/subscriber/deauthorize/NestThermostat/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->URL:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->mContext:Landroid/content/Context;

    .line 22
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 23
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudAuth;

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudAuth;-><init>(Landroid/content/Context;)V

    .line 24
    .local v0, "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->URL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/CloudAuth;->getHomeID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->cloudURL:Ljava/lang/String;

    .line 25
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Nest deactivation URL "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->cloudURL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
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
    .line 86
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 57
    const/16 v0, 0x7530

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 4
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestComplete status: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v1, "nest_deauthorization_response"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    return-void
.end method
