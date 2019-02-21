.class public Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;
.super Ljava/lang/Object;
.source "NestDevicesOnRemoteAccessListener.java"

# interfaces
.implements Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private isFirstNestDeviceRequestIssued:Z


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 1
    .param p1, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;->TAG:Ljava/lang/String;

    .line 17
    return-void
.end method


# virtual methods
.method public onRemoteAccessDisabled()V
    .locals 0

    .prologue
    .line 32
    return-void
.end method

.method public onRemoteAccessEnabled()V
    .locals 2

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;->isFirstNestDeviceRequestIssued:Z

    if-nez v0, :cond_0

    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;->TAG:Ljava/lang/String;

    const-string v1, "Remote Access Enabled Notification received. Fetching Nest Devices."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getNestDevicesFromCloud()V

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/NestDevicesOnRemoteAccessListener;->isFirstNestDeviceRequestIssued:Z

    .line 27
    :cond_0
    return-void
.end method
