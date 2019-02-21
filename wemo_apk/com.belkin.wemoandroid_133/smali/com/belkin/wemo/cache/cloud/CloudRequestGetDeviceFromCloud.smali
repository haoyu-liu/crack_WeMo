.class public Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;
.super Ljava/lang/Object;
.source "CloudRequestGetDeviceFromCloud.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final TIMEOUT_LIMIT:I = 0x3a980

.field private static final URL:Ljava/lang/String;


# instance fields
.field private TIMEOUT:I

.field private cloudURL:Ljava/lang/String;

.field private onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudConstants;->CLOUD_URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/apis/http/device/peerLocalAddresses/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->URL:Ljava/lang/String;

    .line 17
    const-class v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 2
    .param p1, "remoteAccessManager"    # Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
    .param p2, "arpMacs"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const v0, 0xea60

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->TIMEOUT:I

    .line 33
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 34
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->getHomeId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->cloudURL:Ljava/lang/String;

    .line 40
    :goto_0
    return-void

    .line 38
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->URL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->cloudURL:Ljava/lang/String;

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
    .line 94
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
    .line 79
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOnRequestCompleteListener()Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 53
    const v0, 0x3a980

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 3

    .prologue
    .line 58
    sget-object v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CloudCache: URL - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->cloudURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->cloudURL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized requestComplete(ZI[B)V
    .locals 3
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 70
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CloudCache: CloudRequestGetDeviceFromCloud completed. Status code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;->onRequestComplete(ZI[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    :cond_0
    monitor-exit p0

    return-void

    .line 70
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setOnRequestCompleteListener(Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 0
    .param p1, "onRequestCompleteListener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDeviceFromCloud;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 29
    return-void
.end method
