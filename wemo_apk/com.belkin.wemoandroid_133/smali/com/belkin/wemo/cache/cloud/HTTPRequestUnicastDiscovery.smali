.class public Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;
.super Ljava/lang/Object;
.source "HTTPRequestUnicastDiscovery.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final SETUP_XML:Ljava/lang/String;

.field private TIMEOUT:I

.field private final TIMEOUT_LIMIT:I

.field private final URL:Ljava/lang/String;

.field private onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-class v0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 2
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "listener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const v0, 0xafc8

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->TIMEOUT_LIMIT:I

    .line 14
    const/16 v0, 0x7530

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->TIMEOUT:I

    .line 16
    const-string v0, "/setup.xml"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->SETUP_XML:Ljava/lang/String;

    .line 21
    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/setup.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->URL:Ljava/lang/String;

    .line 23
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
    .line 85
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    const-string v0, ""

    return-object v0
.end method

.method public getFileByteArray()[B
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOnRequestCompleteListener()Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    return-object v0
.end method

.method public getRequestMethod()I
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x2

    return v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 41
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->TIMEOUT:I

    return v0
.end method

.method public getTimeoutLimit()I
    .locals 1

    .prologue
    .line 46
    const v0, 0xafc8

    return v0
.end method

.method public getURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->URL:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x0

    return-object v0
.end method

.method public isAuthHeaderRequired()Z
    .locals 1

    .prologue
    .line 80
    const/4 v0, 0x0

    return v0
.end method

.method public requestComplete(ZI[B)V
    .locals 3
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 72
    sget-object v0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unicast response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;->onRequestComplete(ZI[B)V

    .line 76
    :cond_0
    return-void
.end method

.method public setOnRequestCompleteListener(Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V
    .locals 0
    .param p1, "onRequestCompleteListener"    # Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;->onRequestCompleteListener:Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;

    .line 37
    return-void
.end method
