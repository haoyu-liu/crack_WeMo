.class public Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;
.super Ljava/lang/Object;
.source "RMCloudRequestSendDBFile.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private homeId:Ljava/lang/String;

.field private objDataToSend:[B

.field private onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;[B)V
    .locals 2
    .param p1, "homeId"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;
    .param p3, "objectDataToSend"    # [B

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/senddbfile/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->URL:Ljava/lang/String;

    .line 17
    const-class v0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->TAG:Ljava/lang/String;

    .line 18
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->TIMEOUT_LIMIT:I

    .line 19
    const/16 v0, 0x7530

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->TIMEOUT:I

    .line 26
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->homeId:Ljava/lang/String;

    .line 27
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 28
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->objDataToSend:[B

    .line 29
    return-void
.end method


# virtual methods
.method public getAdditionalHeaders()Ljava/util/Map;
    .locals 3
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
    .line 108
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 109
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "Content-Type"

    const-string v2, "application/octet-stream"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 62
    const-string v1, "--MULTIPART-FORM-DATA-BOUNDARY\r\n"

    .line 64
    .local v1, "strPrefix1":Ljava/lang/String;
    const-string v2, "Content-Disposition:form-data;name=filedata;filename=rules.db\r\n"

    .line 66
    .local v2, "strPrefix2":Ljava/lang/String;
    const-string v3, "Content-Type:application/octet-stream\r\n\r\n"

    .line 68
    .local v3, "strPrefix3":Ljava/lang/String;
    const-string v4, "\r\n--MULTIPART-FORM-DATA-BOUNDARY--\r\n"

    .line 72
    .local v4, "strPrefix5":Ljava/lang/String;
    new-instance v0, Lorg/apache/http/util/ByteArrayBuffer;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->objDataToSend:[B

    array-length v5, v5

    invoke-direct {v0, v5}, Lorg/apache/http/util/ByteArrayBuffer;-><init>(I)V

    .line 73
    .local v0, "byteArrBuff":Lorg/apache/http/util/ByteArrayBuffer;
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    array-length v6, v6

    invoke-virtual {v0, v5, v7, v6}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 75
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    array-length v6, v6

    invoke-virtual {v0, v5, v7, v6}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 77
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    array-length v6, v6

    invoke-virtual {v0, v5, v7, v6}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 79
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->objDataToSend:[B

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->objDataToSend:[B

    array-length v6, v6

    invoke-virtual {v0, v5, v7, v6}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 80
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    array-length v6, v6

    invoke-virtual {v0, v5, v7, v6}, Lorg/apache/http/util/ByteArrayBuffer;->append([BII)V

    .line 83
    invoke-virtual {v0}, Lorg/apache/http/util/ByteArrayBuffer;->toByteArray()[B

    move-result-object v5

    check-cast v5, [B

    iput-object v5, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->objDataToSend:[B

    .line 85
    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->objDataToSend:[B

    return-object v5
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x1

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 43
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->homeId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    const-string v0, "rules.db"

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 1
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 96
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestSendDBFile;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;->onRequestComplete(ZI[B)V

    .line 99
    :cond_0
    return-void
.end method
