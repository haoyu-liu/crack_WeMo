.class public Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "GetNestDevicesRequestRunnable.java"


# instance fields
.field private context:Landroid/content/Context;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private nestDevicesOnRemoteAccessListener:Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;

.field private remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;Landroid/content/Context;)V
    .locals 0
    .param p1, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "remoteAccessManager"    # Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 25
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->context:Landroid/content/Context;

    .line 26
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    .line 27
    return-void
.end method


# virtual methods
.method protected getLoggerTag()Ljava/lang/String;
    .locals 4

    .prologue
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 6

    .prologue
    .line 37
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Nest remoteHomeDevices API called; is remote enabled: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 41
    :try_start_0
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->context:Landroid/content/Context;

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V

    .line 43
    .local v2, "nestDevices":Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->context:Landroid/content/Context;

    invoke-direct {v0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 44
    .local v0, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .end local v0    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v2    # "nestDevices":Lcom/belkin/wemo/cache/cloud/CloudRequestGetNestDevice;
    :cond_0
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v1

    .line 46
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->TAG:Ljava/lang/String;

    const-string v4, "Exception: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 49
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->TAG:Ljava/lang/String;

    const-string v4, "makeCloudRequestForNestDevice(): ERROR - Remote access is not enabled."

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->nestDevicesOnRemoteAccessListener:Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;

    if-nez v3, :cond_0

    .line 51
    new-instance v3, Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {v3, v4}, Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    iput-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->nestDevicesOnRemoteAccessListener:Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;

    .line 52
    invoke-static {}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;->nestDevicesOnRemoteAccessListener:Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->addRemoteAccessListener(Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;)Z

    goto :goto_0
.end method
