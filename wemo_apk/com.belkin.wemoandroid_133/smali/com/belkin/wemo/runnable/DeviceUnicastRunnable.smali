.class public Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "DeviceUnicastRunnable.java"


# instance fields
.field private cloudCacheUnicastDeviceDiscovery:Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;

.field private ipAddress:Ljava/lang/String;

.field private port:I

.field private udn:Ljava/lang/String;

.field private unicastListener:Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;)V
    .locals 0
    .param p1, "ipAddress"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "unicastListener"    # Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;
    .param p5, "cloudCacheUnicastDeviceDiscovery"    # Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->ipAddress:Ljava/lang/String;

    .line 19
    iput p2, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->port:I

    .line 20
    iput-object p3, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->udn:Ljava/lang/String;

    .line 21
    iput-object p4, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->unicastListener:Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;

    .line 22
    iput-object p5, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->cloudCacheUnicastDeviceDiscovery:Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;

    .line 24
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 29
    iget-object v1, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UNICAST CALL BEING SENT FOR UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->cloudCacheUnicastDeviceDiscovery:Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;

    iget-object v2, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->ipAddress:Ljava/lang/String;

    iget v3, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->port:I

    iget-object v4, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->udn:Ljava/lang/String;

    iget-object v5, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->unicastListener:Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;->isDeviceReachable(Ljava/lang/String;ILjava/lang/String;Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;)V
    :try_end_0
    .catch Lcom/belkin/wemo/exception/InvalidArgumentsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    :goto_0
    return-void

    .line 32
    :catch_0
    move-exception v0

    .line 33
    .local v0, "e":Lcom/belkin/wemo/exception/InvalidArgumentsException;
    iget-object v1, p0, Lcom/belkin/wemo/runnable/DeviceUnicastRunnable;->TAG:Ljava/lang/String;

    const-string v2, "IPAddress is null"

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
