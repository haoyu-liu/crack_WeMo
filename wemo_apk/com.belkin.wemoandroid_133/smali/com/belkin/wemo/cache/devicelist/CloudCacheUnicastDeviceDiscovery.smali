.class public Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;
.super Ljava/lang/Object;
.source "CloudCacheUnicastDeviceDiscovery.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final TIMEOUT:I = 0x2710


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-class v0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public isDeviceReachable(Ljava/lang/String;ILjava/lang/String;Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;)V
    .locals 8
    .param p1, "ipAddress"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "unicastListener"    # Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 21
    new-instance v6, Lcom/loopj/android/http/SyncHttpClient;

    invoke-direct {v6}, Lcom/loopj/android/http/SyncHttpClient;-><init>()V

    .line 22
    .local v6, "client":Lcom/loopj/android/http/SyncHttpClient;
    const/16 v0, 0x2710

    invoke-virtual {v6, v0}, Lcom/loopj/android/http/SyncHttpClient;->setTimeout(I)V

    .line 24
    if-eqz p1, :cond_0

    .line 25
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

    move-result-object v7

    .line 26
    .local v7, "url":Ljava/lang/String;
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Starting unicast discovery for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":URL - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p4

    move-object v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;-><init>(Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;Ljava/lang/String;I)V

    invoke-virtual {v6, v7, v0}, Lcom/loopj/android/http/SyncHttpClient;->get(Ljava/lang/String;Lcom/loopj/android/http/ResponseHandlerInterface;)Lcom/loopj/android/http/RequestHandle;

    .line 63
    return-void

    .line 58
    .end local v7    # "url":Ljava/lang/String;
    :cond_0
    new-instance v0, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v1, "IPAddress is null"

    invoke-direct {v0, v1}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
