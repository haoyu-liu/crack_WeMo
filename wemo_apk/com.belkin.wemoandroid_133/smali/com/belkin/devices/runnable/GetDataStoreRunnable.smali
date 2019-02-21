.class public Lcom/belkin/devices/runnable/GetDataStoreRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "GetDataStoreRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GetDataStoreRunnable"


# instance fields
.field private bridgeUDN:Ljava/lang/String;

.field private mCallback:Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

.field private mContext:Landroid/content/Context;

.field private mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;Landroid/content/Context;)V
    .locals 1
    .param p1, "bridgeUDN"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 16
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 17
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

    .line 18
    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mContext:Landroid/content/Context;

    .line 19
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->bridgeUDN:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

    .line 24
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 25
    new-instance v0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-direct {v0, p3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    .line 26
    :cond_0
    iput-object p1, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->bridgeUDN:Ljava/lang/String;

    .line 27
    iput-object p3, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mContext:Landroid/content/Context;

    .line 28
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 32
    const-string v0, "GetDataStoreRunnable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Local Mode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    iget-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mUpNpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    iget-object v1, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

    invoke-virtual {v0, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getEmergencyContacts(Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;)V

    .line 49
    :goto_0
    return-void

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->bridgeUDN:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 38
    iget-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_1

    .line 39
    iget-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

    iget-object v2, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->bridgeUDN:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDataStoreFromCloud(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Ljava/lang/String;)V

    goto :goto_0

    .line 41
    :cond_1
    iget-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->onSuccess(Ljava/lang/String;)V

    goto :goto_0

    .line 44
    :cond_2
    const-string v0, "GetDataStoreRunnable"

    const-string v1, "bridge UDN is null"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    iget-object v0, p0, Lcom/belkin/devices/runnable/GetDataStoreRunnable;->mCallback:Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;

    invoke-virtual {v0}, Lcom/belkin/devices/callback/GetDataStoreOnLinkCallBack;->onError()V

    goto :goto_0
.end method
