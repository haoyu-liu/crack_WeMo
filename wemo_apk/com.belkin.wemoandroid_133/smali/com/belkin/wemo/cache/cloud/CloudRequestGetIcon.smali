.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;
.super Ljava/lang/Object;
.source "CloudRequestGetIcon.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private cloudURL:Ljava/lang/String;

.field private devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 2
    .param p1, "devListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const v0, 0x3a980

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->TIMEOUT_LIMIT:I

    .line 17
    const v0, 0xea60

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->TIMEOUT:I

    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/ext/deviceIcon/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->URL:Ljava/lang/String;

    .line 22
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 23
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->cloudURL:Ljava/lang/String;

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
    .line 81
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 38
    const v0, 0x3a980

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 5
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 53
    if-eqz p1, :cond_0

    .line 54
    const/4 v2, 0x0

    array-length v3, p3

    invoke-static {p3, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 55
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_0

    .line 56
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 57
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x64

    invoke-virtual {v1, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 58
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v2, :cond_0

    .line 59
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->mDevMgr:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;->devInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v1, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateRemoteIconFile(Lcom/belkin/wemo/cache/data/DeviceInformation;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 63
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    return-void
.end method
