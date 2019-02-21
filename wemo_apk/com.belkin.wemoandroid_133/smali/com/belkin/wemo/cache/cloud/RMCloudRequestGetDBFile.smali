.class public Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;
.super Ljava/lang/Object;
.source "RMCloudRequestGetDBFile.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final BASE_URL:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private mac:Ljava/lang/String;

.field private onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 2
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const v0, 0x3a980

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->TIMEOUT_LIMIT:I

    .line 12
    const v0, 0xea60

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->TIMEOUT:I

    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/plugin/dbfile/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->BASE_URL:Ljava/lang/String;

    .line 32
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->mac:Ljava/lang/String;

    .line 33
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 34
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
    .line 94
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOnRequestCompleteListener()Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 50
    const v0, 0x3a980

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->BASE_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->mac:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x1

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 3
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 66
    sget-object v0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GetDBVersion Cloud request completed. Status code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;->onRequestComplete(ZI[B)V

    .line 71
    :cond_0
    return-void
.end method

.method public setOnRequestCompleteListener(Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 0
    .param p1, "onRequestCompleteListener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 26
    return-void
.end method
